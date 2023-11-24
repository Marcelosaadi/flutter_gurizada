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

  async findFornecedorItem() {
    return  await this.prisma.tabelacertinho.groupBy({
      by: ['fornecedor', 'item'],
      _sum: {
        quantidade: true,
      },
    });

  }

  async findFornecedorItemTrue() {
    return  await this.prisma.tabelacertinho.groupBy({
      by: ['fornecedor', 'item'],
      _sum: {
        quantidade: true,
      },
      where: {
        entregue: true, 
      },
    });
  }

  async findEscolaItem() {
    return  await this.prisma.tabelacertinho.groupBy({
      by: ['diretoria', 'item'],
      _sum: {
        quantidade: true,
      },
    });

  }

  async findEscolaItemTrue() {
    return  await this.prisma.tabelacertinho.groupBy({
      by: ['diretoria', 'item'],
      _sum: {
        quantidade: true,
      },
      where: {
        entregue: true, 
      },
    });
  }

  async updateEntrega(id: number) {
    return await this.prisma.tabelacertinho.update({
      where: {id: id},
      data: {entregue: true}
    });
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
