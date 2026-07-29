import BoundsSolutionsEquilibriumProblemsSolidCanonicalLaneLean.RiemannianCurvature

/-!
# Equilibrium Variational Inequality Package
-/

namespace HautevilleHouse
namespace BoundsSolutionsEquilibriumProblemsSolidCanonicalLaneLean

structure EquilibriumVariationalInequalityPackage {G : RiemannianCurvaturePackage} where
  feasibleSet : Type u
  convexity : Prop
  variationalInequality : Prop
  solutionExistence : Prop
  uniqueness : Prop

structure EquilibriumVariationalInequalityEvidence {G : RiemannianCurvaturePackage}
    (E : EquilibriumVariationalInequalityPackage G) where
  convexityClosed : E.convexity
  variationalInequalityClosed : E.variationalInequality
  solutionExistenceClosed : E.solutionExistence
  uniquenessClosed : E.uniqueness

def EquilibriumVariationalInequalityClosed {G : RiemannianCurvaturePackage}
    (E : EquilibriumVariationalInequalityPackage G) : Prop :=
  E.convexity ∧ E.variationalInequality ∧ E.solutionExistence ∧ E.uniqueness

theorem equilibrium_variational_inequality_closed_from_evidence
    {G : RiemannianCurvaturePackage} (E : EquilibriumVariationalInequalityPackage G)
    (Ev : EquilibriumVariationalInequalityEvidence E) : EquilibriumVariationalInequalityClosed E := by
  exact And.intro Ev.convexityClosed
    (And.intro Ev.variationalInequalityClosed
      (And.intro Ev.solutionExistenceClosed Ev.uniquenessClosed))

end BoundsSolutionsEquilibriumProblemsSolidCanonicalLaneLean
end HautevilleHouse
