import BoundsSolutionsEquilibriumProblemsSolidCanonicalLaneLean.ComplementarityProblem

/-!
# Nonlinear Complementarity Solver Package
-/

namespace HautevilleHouse
namespace BoundsSolutionsEquilibriumProblemsSolidCanonicalLaneLean

structure NonlinearComplementaritySolverPackage {G : RiemannianCurvaturePackage}
    {E : EquilibriumVariationalInequalityPackage G}
    {S : SemismoothNewtonMethodPackage E} (C : ComplementarityProblemPackage S) where
  boundConstraints : Prop
  solidEligibility : Prop
  solverConvergence : Prop
  errorBounds : Prop

structure NonlinearComplementaritySolverEvidence {G : RiemannianCurvaturePackage}
    {E : EquilibriumVariationalInequalityPackage G}
    {S : SemismoothNewtonMethodPackage E}
    {C : ComplementarityProblemPackage S} (N : NonlinearComplementaritySolverPackage C) where
  boundConstraintsClosed : N.boundConstraints
  solidEligibilityClosed : N.solidEligibility
  solverConvergenceClosed : N.solverConvergence
  errorBoundsClosed : N.errorBounds

def NonlinearComplementaritySolverClosed {G : RiemannianCurvaturePackage}
    {E : EquilibriumVariationalInequalityPackage G}
    {S : SemismoothNewtonMethodPackage E}
    {C : ComplementarityProblemPackage S} (N : NonlinearComplementaritySolverPackage C) : Prop :=
  N.boundConstraints ∧ N.solidEligibility ∧ N.solverConvergence ∧ N.errorBounds

theorem nonlinear_complementarity_solver_closed_from_evidence
    {G : RiemannianCurvaturePackage} {E : EquilibriumVariationalInequalityPackage G}
    {S : SemismoothNewtonMethodPackage E} {C : ComplementarityProblemPackage S}
    (N : NonlinearComplementaritySolverPackage C) (Ev : NonlinearComplementaritySolverEvidence N) :
    NonlinearComplementaritySolverClosed N := by
  exact And.intro Ev.boundConstraintsClosed
    (And.intro Ev.solidEligibilityClosed
      (And.intro Ev.solverConvergenceClosed Ev.errorBoundsClosed))

end BoundsSolutionsEquilibriumProblemsSolidCanonicalLaneLean
end HautevilleHouse
