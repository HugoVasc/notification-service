import { Content } from './content'
import { Notification } from './notification'

describe('Notification', () => {
  it('should be able to create a otification', () => {
    const notification = new Notification({
      content: new Content('Nova atualização de compra'),
      category: 'market',
      recipientId: 'example-recipient-id',
    })
    expect(notification).toBeTruthy()
  })
})