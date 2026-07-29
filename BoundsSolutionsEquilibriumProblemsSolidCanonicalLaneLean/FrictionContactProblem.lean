import BoundsSolutionsEquilibriumProblemsSolidCanonicalLaneLean.SemismoothNewtonSolver

namespace HautevilleHouse
namespace BoundsSolutionsEquilibriumProblemsSolidCanonicalLaneLean

structure FrictionContactProblem (B : BoundsEquilibriumPackage) (V : SolidMechanicsVariationalProblem B) (S : SemismoothNewtonSolver B V) where
  contactSurface : Set V.displacementSpace
  normalForce : V.displacementSpace → ℝ
  tangentialTraction : V.displacementSpace → V.stressSpace
  frictionCone : Set V.stressSpace
  stickCondition : V.displacementSpace → Prop
  slipCondition : V.displacementSpace → Prop

def FrictionContactClosed (F : FrictionContactProblem B V S) : Prop :=
  F.stickCondition F.contactSurface ∧ F.slipCondition F.contactSurface

end BoundsSolutionsEquilibriumProblemsSolidCanonicalLaneLean
end HautevilleHouse