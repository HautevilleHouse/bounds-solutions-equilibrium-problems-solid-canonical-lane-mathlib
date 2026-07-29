import BoundsSolutionsEquilibriumProblemsSolidCanonicalLaneLean.BoundsEquilibriumPackage

namespace HautevilleHouse
namespace BoundsSolutionsEquilibriumProblemsSolidCanonicalLaneLean

structure SolidMechanicsVariationalProblem (B : BoundsEquilibriumPackage) where
  displacementSpace : Type u
  stressSpace : Type v
  bilinearForm : displacementSpace → displacementSpace → ℝ
  linearFunctional : displacementSpace → ℝ
  constitutiveLaw : stressSpace → stressSpace
  equilibriumEquation : displacementSpace → Prop
  frictionBound : ℝ

def VariationalProblemClosed (V : SolidMechanicsVariationalProblem B) : Prop :=
  V.equilibriumEquation V.displacementSpace ∧ V.frictionBound > 0

end BoundsSolutionsEquilibriumProblemsSolidCanonicalLaneLean
end HautevilleHouse