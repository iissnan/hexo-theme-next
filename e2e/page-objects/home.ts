import { browser } from 'protractor';

export class HomePage {
  get() {
    browser.waitForAngularEnabled(false);
    browser.get('/');
  }
}
