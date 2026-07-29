import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BoundsSolutionsEquilibriumProblemsSolidCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BoundsSolutionsEquilibriumProblemsSolidCanonicalLaneLean

structure BoundaryValueProblem where
  domainShape : Type u
  loadDistribution : domainShape → ℝ
  materialStiffness : Type v
  equilibriumEquation : Type w
  boundaryCondition : Prop
  weakFormulation : Prop

structure BoundaryValueEvidence (B : BoundaryValueProblem) where
  domainShapeClosed : True
  loadDistributionClosed : True
  materialStiffnessClosed : True
  equilibriumEquationClosed : True
  boundaryConditionClosed : B.boundaryCondition
  weakFormulationClosed : B.weakFormulation

def BoundaryValueProblemClosed (B : BoundaryValueProblem) : Prop :=
  B.boundaryCondition ∧ B.weakFormulation

theorem boundary_value_problem_closed_from_evidence (B : BoundaryValueProblem) (E : BoundaryValueEvidence B) : BoundaryValueProblemClosed B :=
  And.intro E.boundaryConditionClosed E.weakFormulationClosed

end BoundsSolutionsEquilibriumProblemsSolidCanonicalLaneLean
end HautevilleHouse