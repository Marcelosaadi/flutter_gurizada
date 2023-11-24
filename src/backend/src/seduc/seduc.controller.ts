import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { SeducService } from './seduc.service';
import { CreateSeducDto } from './dto/create-seduc.dto';
import path from 'path';


@Controller('seduc')
export class SeducController {
  constructor(private readonly seducService: SeducService) {}

  @Post()
  create(@Body() createSeducDto: CreateSeducDto) {
    return this.seducService.create(createSeducDto);
  }

  @Get()
  findAll() {
    return this.seducService.findAll();
  }

  @Get('/itens')
  findItens() {
    return this.seducService.findItemQuantities();
  }


  @Patch('/entrega/:id')
  update(@Param('id') id: string) {
    return this.seducService.updateEntrega(+id);
  }

  @Get('/diretoria')
  findEscola() {
    return this.seducService.findDiretoriaQuantities();
  }


  @Get('/fornecedor/escola/:fornecedor')
  findEscolaFornecedor(@Param('fornecedor') fornecedor: string) {
    return this.seducService.findItemFornecedorByName(fornecedor);
  }


  @Get('/cie/diretoria/:diretoria')
  findCieDiretoria(@Param('diretoria') diretoria: string) {
    return this.seducService.findEscolaDiretoria(diretoria);
  }


  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.seducService.remove(+id);
  }
}
