import BoundsSolutionsEquilibriumProblemsSolidCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BoundsSolutionsEquilibriumProblemsSolidCanonicalLaneLean

structure BoundsEquilibriumPackage where
  objectiveSpace : Type u
  constraintSpace : Type v
  feasibleSet : Set objectiveSpace × Set constraintSpace
  equilibriumOperator : objectiveSpace → constraintSpace
  aPrioriBound : ℝ
  solutionExistence : Prop
  stabilityMargin : Prop

structure BoundsEquilibriumEvidence (B : BoundsEquilibriumPackage) where
  feasibleNonemptyClosed : B.feasibleSet.1.Nonempty ∧ B.feasibleSet.2.Nonempty
  solutionExistenceClosed : B.solutionExistence
  stabilityMarginClosed : B.stabilityMargin

def BoundsEquilibriumClosed (B : BoundsEquilibriumPackage) : Prop :=
  (B.feasibleSet.1.Nonempty ∧ B.feasibleSet.2.Nonempty) ∧
  B.solutionExistence ∧ B.stabilityMargin

theorem bounds_equilibrium_closed_from_evidence
    (B : BoundsEquilibriumPackage) (E : BoundsEquilibriumEvidence B) :
    BoundsEquilibriumClosed B := by
  exact And.intro E.feasibleNonemptyClosed
    (And.intro E.solutionExistenceClosed E.stabilityMarginClosed)

end BoundsSolutionsEquilibriumProblemsSolidCanonicalLaneLean
end HautevilleHouse