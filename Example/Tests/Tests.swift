// https://github.com/Quick/Quick

import Quick
import Nimble
import SwiftyPluralizer

class TableOfContentsSpec: QuickSpec {
  
  override func spec() {
    describe("to plural") {
      it("empty plural") {
        expect("".plural) == ""
      }

      it("singular to plural") {
        for (singular, plural) in TestCases.singularToPlural {
          expect(singular.plural) == plural
        }
      }
      
      it("pluralizing singulars") {
        for (singular, plural) in TestCases.singularToPlural {
          var s = singular
          expect(s.pluralize()) == plural
          expect(s) == plural
        }
      }
    }
    
    describe("to singular") {
      it("empty singular") {
        expect("".singular) == ""
      }

      it("plural to singular") {
        for (singular, plural) in TestCases.singularToPlural {
          expect(plural.singular) == singular
        }
      }
    
      it("singularize plurals") {
        for (singular, plural) in TestCases.singularToPlural {
          var p = plural
          expect(p.singularize()) == singular
          expect(p) == singular
        }
      }
    }
  }
}
