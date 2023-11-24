import { Module } from '@nestjs/common';
import { SeducModule } from './seduc/seduc.module';

@Module({
  imports: [SeducModule],
  controllers: [],
  providers: [],
})
export class AppModule {}
