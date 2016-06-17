// https://github.com/Quick/Quick

import Quick
import Nimble
import SwiftyPluralizer

class TableOfContentsSpec: QuickSpec {
  
  override func spec() {
    describe("these will fail") {
      
      it("can do maths") {
        for (singular, plural) in TestCases.singularToPlural {
          expect(singular.plural) == plural
        }
      }
    }
  }
}
