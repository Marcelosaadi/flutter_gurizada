import { Injectable } from '@nestjs/common';
import { CreateSeducDto } from './dto/create-seduc.dto';
import { PrismaService } from 'src/prisma.service';
import { ADDRGETNETWORKPARAMS } from 'dns';

@Injectable()
export class SeducService {
  constructor(private prisma: PrismaService) {}
  async create(createSeducDto: CreateSeducDto) {
    return await this.prisma.tabelacertinho.create({
      data:{
        item: createSeducDto.item,
        diretoria: createSeducDto.diretoria,
        quantidade: createSeducDto.quantidade,
        fornecedor: createSeducDto.fornecedor,
        cie: createSeducDto.cie,
        prazo: createSeducDto.prazo,
        entregue: false
      }
    })
    
  }

  findAll() {
    return `This action returns all seduc`;
  }

  async findItemQuantities() {
    // Soma total de itens
    const totalQuantities = await this.prisma.tabelacertinho.groupBy({
      by: ['item', 'fornecedor'],
      _sum: {
        quantidade: true,
      },
    });
  
    // Soma total de itens entregues
    const deliveredQuantities = await this.prisma.tabelacertinho.groupBy({
      by: ['item', 'fornecedor'],
      _sum: {
        quantidade: true,
      },
      where: {
        entregue: true,
      },
    });
  
    // Combinar os dois resultados
    const combinedQuantities = totalQuantities.map(total => {
      const delivered = deliveredQuantities.find(delivered => 
        delivered.item === total.item && delivered.fornecedor === total.fornecedor
      );
  
      return {
        item: total.item,
        fornecedor: total.fornecedor,
        quantidade_total: total._sum.quantidade.toString(),
        quantidade_entregue: delivered ? delivered._sum.quantidade.toString() : '0',
      };
    });
  
    return combinedQuantities;
  }
  
  async findDiretoriaQuantities() {
    // Soma total de itens por diretoria
    const totalQuantities = await this.prisma.tabelacertinho.groupBy({
      by: ['diretoria'],
      _sum: {
        quantidade: true,
      },
    });
  
    // Soma total de itens entregues por diretoria
    const deliveredQuantities = await this.prisma.tabelacertinho.groupBy({
      by: ['diretoria'],
      _sum: {
        quantidade: true,
      },
      where: {
        entregue: true,
      },
    });
  
    // Combinar os dois resultados
    const combinedQuantities = totalQuantities.map(total => {
      const delivered = deliveredQuantities.find(delivered => 
        delivered.diretoria === total.diretoria
      );
  
      return {
        diretoria: total.diretoria,
        quantidade_total: total._sum.quantidade.toString() || '0',
        quantidade_entregue: delivered ? delivered._sum.quantidade.toString() || '0' : '0',
      };
    });
  
    return combinedQuantities;
  }
  


  async updateEntrega(id: number) {
    return await this.prisma.tabelacertinho.update({
      where: {id: id},
      data: {entregue: true}
    });
  }

  async findItemFornecedorByName(fornecedor: string) {
    // Soma total de itens
    const totalQuantities = await this.prisma.tabelacertinho.groupBy({
      by: ['item', 'cie'],
      _sum: {
        quantidade: true,
      },
      where: {
        fornecedor: fornecedor,
      },
    });
  
    // Soma total de itens entregues
    const deliveredQuantities = await this.prisma.tabelacertinho.groupBy({
      by: ['item', 'cie'],
      _sum: {
        quantidade: true,
      },
      where: {
        entregue: true,
        fornecedor: fornecedor,
      },
    });
  
    // Combinar os dois resultados
    const combinedQuantities = totalQuantities.map(total => {
      const delivered = deliveredQuantities.find(delivered => 
        delivered.item === total.item && delivered.cie === total.cie
      );
  
      return {
        item: total.item,
        cie: total.cie,
        quantidade_total: total._sum.quantidade.toString(),
        quantidade_entregue: delivered ? delivered._sum.quantidade.toString() : '0',
      };
    });
  
    return combinedQuantities;
  }

  async findEntregasFornecedorCie(fornecedor: string){
    return await this.prisma.tabelacertinho.groupBy({
      by: ['item', 'cie'],
      _sum: {
        quantidade: true,
      },
      where: {
        fornecedor: fornecedor,
      },
    });
  }

  async findEntregasFornecedorCieTrue(fornecedor: string){
    return await this.prisma.tabelacertinho.groupBy({
      by: ['item', 'cie'],
      _sum: {
        quantidade: true,
      },
      where: {
        fornecedor: fornecedor,
        entregue: true,
      },
    });
  }

  async findEscolaDiretoria(diretoria: string){
    return await this.prisma.tabelacertinho.groupBy({
      by: ['item', 'cie'],
      _sum: {
        quantidade: true,
      },
      where: {
        diretoria: diretoria,
      },
    });
  }

  async findEscolaDiretoriaTrue(diretoria: string){
    return await this.prisma.tabelacertinho.groupBy({
      by: ['item', 'cie'],
      _sum: {
        quantidade: true,
      },
      where: {
        diretoria: diretoria,
        entregue: true,
      },
    });
  }



  remove(id: number) {
    return `This action removes a #${id} seduc`;
  }
}
