import BoundsSolutionsEquilibriumProblemsSolidCanonicalLaneLean.EquilibriumPackage

/-!
# Solid Body Mechanics Package
-/

namespace HautevilleHouse
namespace BoundsSolutionsEquilibriumProblemsSolidCanonicalLaneLean

structure SolidBodyMechanicsPackage {B : BoundsPackage}
    {S : SolutionExistencePackage B} {E : EquilibriumPackage S} where
  elasticityTensor : Type u
  stressStrainRelation : Prop
  constitutiveLaw : Prop
  boundaryValueProblem : Prop

structure SolidBodyMechanicsEvidence {B : BoundsPackage}
    {S : SolutionExistencePackage B} {E : EquilibriumPackage S}
    (M : SolidBodyMechanicsPackage) where
  stressStrainRelationClosed : M.stressStrainRelation
  constitutiveLawClosed : M.constitutiveLaw
  boundaryValueProblemClosed : M.boundaryValueProblem

def SolidBodyMechanicsClosed {B : BoundsPackage}
    {S : SolutionExistencePackage B} {E : EquilibriumPackage S}
    (M : SolidBodyMechanicsPackage) : Prop :=
  M.stressStrainRelation ∧ M.constitutiveLaw ∧ M.boundaryValueProblem

theorem solid_body_mechanics_closed_from_evidence
    {B : BoundsPackage} {S : SolutionExistencePackage B}
    {E : EquilibriumPackage S} (M : SolidBodyMechanicsPackage)
    (Ev : SolidBodyMechanicsEvidence M) : SolidBodyMechanicsClosed M := by
  exact And.intro Ev.stressStrainRelationClosed
    (And.intro Ev.constitutiveLawClosed Ev.boundaryValueProblemClosed)

end BoundsSolutionsEquilibriumProblemsSolidCanonicalLaneLean
end HautevilleHouse