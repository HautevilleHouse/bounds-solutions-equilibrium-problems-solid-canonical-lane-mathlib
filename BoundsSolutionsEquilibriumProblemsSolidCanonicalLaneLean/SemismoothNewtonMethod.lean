import BoundsSolutionsEquilibriumProblemsSolidCanonicalLaneLean.EquilibriumVariationalInequality

/-!
# Semismooth Newton Method Package
-/

namespace HautevilleHouse
namespace BoundsSolutionsEquilibriumProblemsSolidCanonicalLaneLean

structure SemismoothNewtonMethodPackage {G : RiemannianCurvaturePackage}
    (E : EquilibriumVariationalInequalityPackage G) where
  generalizedJacobian : Prop
  localConvergence : Prop
  superlinearRate : Prop
  globalizationStrategy : Prop

structure SemismoothNewtonMethodEvidence {G : RiemannianCurvaturePackage}
    {E : EquilibriumVariationalInequalityPackage G} (S : SemismoothNewtonMethodPackage E) where
  generalizedJacobianClosed : S.generalizedJacobian
  localConvergenceClosed : S.localConvergence
  superlinearRateClosed : S.superlinearRate
  globalizationStrategyClosed : S.globalizationStrategy

def SemismoothNewtonMethodClosed {G : RiemannianCurvaturePackage}
    {E : EquilibriumVariationalInequalityPackage G} (S : SemismoothNewtonMethodPackage E) : Prop :=
  S.generalizedJacobian ∧ S.localConvergence ∧ S.superlinearRate ∧ S.globalizationStrategy

theorem semismooth_newton_method_closed_from_evidence
    {G : RiemannianCurvaturePackage} {E : EquilibriumVariationalInequalityPackage G}
    (S : SemismoothNewtonMethodPackage E) (Ev : SemismoothNewtonMethodEvidence S) :
    SemismoothNewtonMethodClosed S := by
  exact And.intro Ev.generalizedJacobianClosed
    (And.intro Ev.localConvergenceClosed
      (And.intro Ev.superlinearRateClosed Ev.globalizationStrategyClosed))

end BoundsSolutionsEquilibriumProblemsSolidCanonicalLaneLean
end HautevilleHouse
