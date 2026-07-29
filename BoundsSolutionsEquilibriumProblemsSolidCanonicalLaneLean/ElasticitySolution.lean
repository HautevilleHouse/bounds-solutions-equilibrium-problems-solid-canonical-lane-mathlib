import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BoundsSolutionsEquilibriumProblemsSolidCanonicalLaneLean.AdmissibleClass
import HautevilleHouse.BoundsSolutionsEquilibriumProblemsSolidCanonicalLaneLean.BoundaryValueProblem
import HautevilleHouse.BoundsSolutionsEquilibriumProblemsSolidCanonicalLaneLean.EnergyMinimization

namespace HautevilleHouse
namespace BoundsSolutionsEquilibriumProblemsSolidCanonicalLaneLean

structure ElasticitySolutionPackage {B : BoundaryValueProblem} {E : EnergyMinimizationPackage B} where
  displacementField : B.domainShape → ℝ
  strainTensor : Type u
  stressTensor : Type v
  constitutiveLaw : Prop
  linearElasticityAssumption : Prop
  solutionRegularity : Prop

structure ElasticitySolutionEvidence {B : BoundaryValueProblem} {E : EnergyMinimizationPackage B} (S : ElasticitySolutionPackage B E) where
  constitutiveLawClosed : S.constitutiveLaw
  linearElasticityAssumptionClosed : S.linearElasticityAssumption
  solutionRegularityClosed : S.solutionRegularity

def ElasticitySolutionClosed {B : BoundaryValueProblem} {E : EnergyMinimizationPackage B} (S : ElasticitySolutionPackage B E) : Prop :=
  S.constitutiveLaw ∧ S.linearElasticityAssumption ∧ S.solutionRegularity

theorem elasticity_solution_closed_from_evidence {B : BoundaryValueProblem} {E : EnergyMinimizationPackage B} (S : ElasticitySolutionPackage B E) (Ev : ElasticitySolutionEvidence S) : ElasticitySolutionClosed S :=
  And.intro Ev.constitutiveLawClosed (And.intro Ev.linearElasticityAssumptionClosed Ev.solutionRegularityClosed)

end BoundsSolutionsEquilibriumProblemsSolidCanonicalLaneLean
end HautevilleHouse