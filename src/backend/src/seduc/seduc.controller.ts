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
  findOne() {
    return this.seducService.findFornecedorItem();
  }

  @Get('/itens/true')
  findOneTrue() {
    return this.seducService.findFornecedorItemTrue();
  }

  @Patch('/entrega/:id')
  update(@Param('id') id: string) {
    return this.seducService.updateEntrega(+id);
  }

  @Get('/escola')
  findEscola() {
    return this.seducService.findEscolaItem();
  }

  @Get('/escola/true')
  findEscolaTrue() {
    return this.seducService.findEscolaItemTrue();
  }

  @Get('/fornecedor/escola/:fornecedor')
  findEscolaFornecedor(@Param('fornecedor') fornecedor: string) {
    return this.seducService.findEntregasFornecedorCie(fornecedor);
  }

  @Get('/fornecedor/escola/true/:fornecedor')
  findEscolaFornecedorTrue(@Param('fornecedor') fornecedor: string) {
    return this.seducService.findEntregasFornecedorCieTrue(fornecedor);
  }

  @Get('/cie/diretoria/:diretoria')
  findCieDiretoria(@Param('diretoria') diretoria: string) {
    return this.seducService.findEscolaDiretoria(diretoria);
  }

  @Get('/cie/diretoria/true/:diretoria')
  findCieDiretoriaTrue(@Param('diretoria') diretoria: string) {
    return this.seducService.findEscolaDiretoriaTrue(diretoria);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.seducService.remove(+id);
  }
}
