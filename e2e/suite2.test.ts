import {by, device, element, expect} from 'detox';

describe('DetoxTest suite - 2', () => {
  beforeAll(async () => {
    await device.relaunchApp();
  });

  it('should show Step One', async () => {
    await expect(element(by.text('Step One'))).toBeVisible();
    console.log('***************    Step One       ***********');
  });

  it('should show Debug', async () => {
    // await element(by.id('hello_button')).tap();
    await expect(element(by.text('Debug'))).toBeVisible();
    console.log('***************    Debug       ***********');
  });

  // it('should show Learn more', async () => {
  //   // await element(by.id('world_button')).tap();
  //   await expect(element(by.text('Learn More'))).toBeVisible();
  // });
});
