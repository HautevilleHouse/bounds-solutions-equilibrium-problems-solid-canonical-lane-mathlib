import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BoundsSolutionsEquilibriumProblemsSolidCanonicalLaneLean.AdmissibleClass
import HautevilleHouse.BoundsSolutionsEquilibriumProblemsSolidCanonicalLaneLean.BoundaryValueProblem

namespace HautevilleHouse
namespace BoundsSolutionsEquilibriumProblemsSolidCanonicalLaneLean

structure EnergyMinimizationPackage {B : BoundaryValueProblem} where
  energyFunctional : (B.domainShape → ℝ) → ℝ
  convexityCondition : Prop
  lowerSemicontinuity : Prop
  coercivityCondition : Prop
  minimizerExistence : Prop
  minimizerUniqueness : Prop

structure EnergyMinimizationEvidence {B : BoundaryValueProblem} (E : EnergyMinimizationPackage B) where
  convexityConditionClosed : E.convexityCondition
  lowerSemicontinuityClosed : E.lowerSemicontinuity
  coercivityConditionClosed : E.coercivityCondition
  minimizerExistenceClosed : E.minimizerExistence
  minimizerUniquenessClosed : E.minimizerUniqueness

def EnergyMinimizationClosed {B : BoundaryValueProblem} (E : EnergyMinimizationPackage B) : Prop :=
  E.convexityCondition ∧ E.lowerSemicontinuity ∧ E.coercivityCondition ∧ E.minimizerExistence ∧ E.minimizerUniqueness

theorem energy_minimization_closed_from_evidence {B : BoundaryValueProblem} (E : EnergyMinimizationPackage B) (Ev : EnergyMinimizationEvidence E) : EnergyMinimizationClosed E :=
  And.intro Ev.convexityConditionClosed (And.intro Ev.lowerSemicontinuityClosed (And.intro Ev.coercivityConditionClosed (And.intro Ev.minimizerExistenceClosed Ev.minimizerUniquenessClosed)))

end BoundsSolutionsEquilibriumProblemsSolidCanonicalLaneLean
end HautevilleHouse