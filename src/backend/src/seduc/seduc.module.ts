import { Module } from '@nestjs/common';
import { SeducService } from './seduc.service';
import { SeducController } from './seduc.controller';
import { PrismaService } from 'src/prisma.service';

@Module({
  controllers: [SeducController],
  providers: [SeducService, PrismaService],
})
export class SeducModule {}
