import BoundsSolutionsEquilibriumProblemsSolidCanonicalLaneLean.SolutionExistencePackage

/-!
# Equilibrium Package
-/

namespace HautevilleHouse
namespace BoundsSolutionsEquilibriumProblemsSolidCanonicalLaneLean

structure EquilibriumPackage {B : BoundsPackage}
    (S : SolutionExistencePackage B) where
  equilibriumState : Type u
  equilibriumCondition : Prop
  approachRate : Prop
  stabilityProperty : Prop

structure EquilibriumEvidence {B : BoundsPackage}
    {S : SolutionExistencePackage B} (E : EquilibriumPackage S) where
  equilibriumConditionClosed : E.equilibriumCondition
  approachRateClosed : E.approachRate
  stabilityPropertyClosed : E.stabilityProperty

def EquilibriumClosed {B : BoundsPackage}
    {S : SolutionExistencePackage B} (E : EquilibriumPackage S) : Prop :=
  E.equilibriumCondition ∧ E.approachRate ∧ E.stabilityProperty

theorem equilibrium_closed_from_evidence
    {B : BoundsPackage} {S : SolutionExistencePackage B}
    (E : EquilibriumPackage S) (Ev : EquilibriumEvidence E) :
    EquilibriumClosed E := by
  exact And.intro Ev.equilibriumConditionClosed
    (And.intro Ev.approachRateClosed Ev.stabilityPropertyClosed)

end BoundsSolutionsEquilibriumProblemsSolidCanonicalLaneLean
end HautevilleHouse