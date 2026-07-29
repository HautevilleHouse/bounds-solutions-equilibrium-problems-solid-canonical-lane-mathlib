import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundsSolutionsEquilibriumProblemsSolidCanonicalLaneLean

structure EquilibriumSolutionPackage (A : AdmissibleClass) where
  existence : Prop
  uniqueness : Prop
  stabilityOpenCondition : Prop
  solidContinuation : Prop

structure EquilibriumSolutionEvidence {A : AdmissibleClass} (P : EquilibriumSolutionPackage A) where
  existenceClosed : P.existence
  uniquenessClosed : P.uniqueness
  stabilityOpenConditionClosed : P.stabilityOpenCondition
  solidContinuationClosed : P.solidContinuation

def EquilibriumSolutionClosed {A : AdmissibleClass} (P : EquilibriumSolutionPackage A) : Prop :=
  P.existence ∧ P.uniqueness ∧ P.stabilityOpenCondition ∧ P.solidContinuation

theorem equilibrium_solution_closed_from_evidence
    {A : AdmissibleClass} (P : EquilibriumSolutionPackage A) (E : EquilibriumSolutionEvidence P) :
    EquilibriumSolutionClosed P := by
  exact And.intro E.existenceClosed
    (And.intro E.uniquenessClosed
      (And.intro E.stabilityOpenConditionClosed E.solidContinuationClosed))

end BoundsSolutionsEquilibriumProblemsSolidCanonicalLaneLean
end HautevilleHouse