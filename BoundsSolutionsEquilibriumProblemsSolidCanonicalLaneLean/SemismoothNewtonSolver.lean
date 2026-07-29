import BoundsSolutionsEquilibriumProblemsSolidCanonicalLaneLean.SolidMechanicsVariationalProblem

namespace HautevilleHouse
namespace BoundsSolutionsEquilibriumProblemsSolidCanonicalLaneLean

structure SemismoothNewtonSolver (B : BoundsEquilibriumPackage) (V : SolidMechanicsVariationalProblem B) where
  iterationSequence : ℕ → V.displacementSpace
  residualTolerance : ℝ
  maxIterations : ℕ
  converged : Prop
  localConvergenceRate : ℝ

def SolverClosed (S : SemismoothNewtonSolver B V) : Prop :=
  S.converged ∧ S.localConvergenceRate > 0

end BoundsSolutionsEquilibriumProblemsSolidCanonicalLaneLean
end HautevilleHouse