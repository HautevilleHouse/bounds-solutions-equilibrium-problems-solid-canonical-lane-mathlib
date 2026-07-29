import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BoundsSolutionsEquilibriumProblemsSolidCanonicalLaneLean.AdmissibleClass
import HautevilleHouse.BoundsSolutionsEquilibriumProblemsSolidCanonicalLaneLean.BoundaryValueProblem
import HautevilleHouse.BoundsSolutionsEquilibriumProblemsSolidCanonicalLaneLean.EnergyMinimization

namespace HautevilleHouse
namespace BoundsSolutionsEquilibriumProblemsSolidCanonicalLaneLean

structure FiniteElementDiscretizationPackage {B : BoundaryValueProblem} {E : EnergyMinimizationPackage B} where
  meshFamily : Type u
  basisFunctions : Type v
  galerkinApproximation : Prop
  errorEstimate : Prop
  convergenceRate : Prop

structure FiniteElementDiscretizationEvidence {B : BoundaryValueProblem} {E : EnergyMinimizationPackage B} (F : FiniteElementDiscretizationPackage B E) where
  galerkinApproximationClosed : F.galerkinApproximation
  errorEstimateClosed : F.errorEstimate
  convergenceRateClosed : F.convergenceRate

def FiniteElementDiscretizationClosed {B : BoundaryValueProblem} {E : EnergyMinimizationPackage B} (F : FiniteElementDiscretizationPackage B E) : Prop :=
  F.galerkinApproximation ∧ F.errorEstimate ∧ F.convergenceRate

theorem finite_element_discretization_closed_from_evidence {B : BoundaryValueProblem} {E : EnergyMinimizationPackage B} (F : FiniteElementDiscretizationPackage B E) (Ev : FiniteElementDiscretizationEvidence F) : FiniteElementDiscretizationClosed F :=
  And.intro Ev.galerkinApproximationClosed (And.intro Ev.errorEstimateClosed Ev.convergenceRateClosed)

end BoundsSolutionsEquilibriumProblemsSolidCanonicalLaneLean
end HautevilleHouse