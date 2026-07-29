import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundsSolutionsEquilibriumProblemsSolidCanonicalLaneLean

structure StabilityBoundPackage (A : AdmissibleClass) where
  lowerBound : Prop
  upperBound : Prop
  equilibriumMargin : Prop
  solidPhaseCondition : Prop

structure StabilityBoundEvidence {A : AdmissibleClass} (P : StabilityBoundPackage A) where
  lowerBoundClosed : P.lowerBound
  upperBoundClosed : P.upperBound
  equilibriumMarginClosed : P.equilibriumMargin
  solidPhaseConditionClosed : P.solidPhaseCondition

def StabilityBoundClosed {A : AdmissibleClass} (P : StabilityBoundPackage A) : Prop :=
  P.lowerBound ∧ P.upperBound ∧ P.equilibriumMargin ∧ P.solidPhaseCondition

theorem stability_bound_closed_from_evidence
    {A : AdmissibleClass} (P : StabilityBoundPackage A) (E : StabilityBoundEvidence P) :
    StabilityBoundClosed P := by
  exact And.intro E.lowerBoundClosed
    (And.intro E.upperBoundClosed
      (And.intro E.equilibriumMarginClosed E.solidPhaseConditionClosed))

end BoundsSolutionsEquilibriumProblemsSolidCanonicalLaneLean
end HautevilleHouse