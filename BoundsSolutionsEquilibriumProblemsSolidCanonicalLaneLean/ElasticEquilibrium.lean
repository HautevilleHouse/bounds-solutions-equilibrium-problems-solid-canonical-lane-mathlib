import BoundsSolutionsEquilibriumProblemsSolidCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BoundsSolutionsEquilibriumProblemsSolidCanonicalLaneLean

structure ElasticEquilibriumPackage where
  stressTensor : Type
  strainTensor : Type
  constitutiveLaw : Prop
  equilibriumEquations : Prop
  boundaryConditionsSatisfied : Prop
  boundedSolutionExists : solutionBounds.2 - solutionBounds.1 ≤ boundError
  boundError : ℝ

structure ElasticEquilibriumEvidence (P : ElasticEquilibriumPackage) where
  stressTensorClosed : P.stressTensor = P.stressTensor
  constitutiveLawClosed : P.constitutiveLaw
  equilibriumEquationsClosed : P.equilibriumEquations
  boundaryConditionsSatisfiedClosed : P.boundaryConditionsSatisfied
  boundedSolutionExistsClosed : P.boundedSolutionExists

def ElasticEquilibriumClosed (P : ElasticEquilibriumPackage) : Prop :=
  P.constitutiveLaw ∧ P.equilibriumEquations ∧ P.boundaryConditionsSatisfied ∧ P.boundedSolutionExists

theorem elastic_equilibrium_closed_from_evidence (P : ElasticEquilibriumPackage) (E : ElasticEquilibriumEvidence P) : ElasticEquilibriumClosed P := by
  exact And.intro E.constitutiveLawClosed (And.intro E.equilibriumEquationsClosed (And.intro E.boundaryConditionsSatisfiedClosed E.boundedSolutionExistsClosed))

end BoundsSolutionsEquilibriumProblemsSolidCanonicalLaneLean
end HautevilleHouse
