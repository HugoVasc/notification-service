import { Controller, Get } from '@nestjs/common';
import { Body, Post } from '@nestjs/common/decorators';
import { AppService } from '../app.service';
import { PrismaService } from './prisma.service';
import { randomUUID } from 'crypto';
import { createNotificationBody, getNotificationBody } from './notification-interfaces';

@Controller()
export class AppController {
  constructor(
    private readonly appService: AppService,
    private readonly prismaService: PrismaService
    ) {}

  @Get()
  getHello(): string {
    return this.appService.getHello();
  }

  @Get('notifications')
  getNotifications(): Promise<getNotificationBody[]> {
    return this.prismaService.notification.findMany();
  }

  @Post('notifications')
  async createNotification(@Body() notification: createNotificationBody){
    const {content, category, recipientId} = notification;
    return await this.prismaService.notification.create({
      data: {
        id: randomUUID(),
        content,
        category,
        recipientId,
      }
    });
  }
}
