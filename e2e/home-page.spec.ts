import {browser} from 'protractor';
import { HomePage } from './page-objects/home';

describe('Home Page', () => {
  let homePage = new HomePage();

  it('should render correct title', () => {
    homePage.get();
    expect(browser.getTitle()).toEqual("IIssNan's Notes");
  });
});
