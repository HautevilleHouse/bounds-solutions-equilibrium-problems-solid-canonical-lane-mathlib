import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundsSolutionsEquilibriumProblemsSolidCanonicalLaneLean

structure BoundsPackage where
  lowerBound : ℝ
  upperBound : ℝ
  boundConstraints : Prop
  boundSatisfied : Prop

structure BoundsEvidence (B : BoundsPackage) where
  boundConstraintsClosed : B.boundConstraints
  boundSatisfiedClosed : B.boundSatisfied

def BoundsClosed (B : BoundsPackage) : Prop :=
  B.boundConstraints ∧ B.boundSatisfied

theorem bounds_closed_from_evidence (B : BoundsPackage) (E : BoundsEvidence B) :
    BoundsClosed B := by
  exact And.intro E.boundConstraintsClosed E.boundSatisfiedClosed

structure SolutionsPackage where
  feasibleSet : Set ℝ
  solutionPoint : ℝ
  feasibilityProof : solutionPoint ∈ feasibleSet
  optimality : Prop

structure SolutionsEvidence (S : SolutionsPackage) where
  feasibilityClosed : S.solutionPoint ∈ S.feasibleSet
  optimalityClosed : S.optimality

def SolutionsClosed (S : SolutionsPackage) : Prop :=
  S.solutionPoint ∈ S.feasibleSet ∧ S.optimality

theorem solutions_closed_from_evidence (S : SolutionsPackage) (E : SolutionsEvidence S) :
    SolutionsClosed S := by
  exact And.intro E.feasibilityClosed E.optimalityClosed

end BoundsSolutionsEquilibriumProblemsSolidCanonicalLaneLean
end HautevilleHouse