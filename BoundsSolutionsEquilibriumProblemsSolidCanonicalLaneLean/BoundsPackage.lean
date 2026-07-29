import BoundsSolutionsEquilibriumProblemsSolidCanonicalLaneLean.AdmissibleClass

/-!
# Bounds Package
-/

namespace HautevilleHouse
namespace BoundsSolutionsEquilibriumProblemsSolidCanonicalLaneLean

structure BoundsPackage where
  domain : Type u
  norm : domain → ℝ
  lowerBound : ℝ
  upperBound : ℝ
  boundedBelow : Prop
  boundedAbove : Prop
  boundAchieved : Prop

structure BoundsEvidence (B : BoundsPackage) where
  boundedBelowClosed : B.boundedBelow
  boundedAboveClosed : B.boundedAbove
  boundAchievedClosed : B.boundAchieved

def BoundsClosed (B : BoundsPackage) : Prop :=
  B.boundedBelow ∧ B.boundedAbove ∧ B.boundAchieved

theorem bounds_closed_from_evidence
    (B : BoundsPackage) (E : BoundsEvidence B) : BoundsClosed B := by
  exact And.intro E.boundedBelowClosed
    (And.intro E.boundedAboveClosed E.boundAchievedClosed)

end BoundsSolutionsEquilibriumProblemsSolidCanonicalLaneLean
end HautevilleHouse