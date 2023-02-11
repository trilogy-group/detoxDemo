import {by, device, element, expect} from 'detox';

describe('DetoxTest (goodbye)', () => {
  beforeEach(async () => {
    await device.reloadReactNative();
  });

  it('should show goodbye screen after tap', async () => {
    // await element(by.text('Style')).tap();
    await expect(element(by.text('Step One'))).toBeVisible();
  });
});
