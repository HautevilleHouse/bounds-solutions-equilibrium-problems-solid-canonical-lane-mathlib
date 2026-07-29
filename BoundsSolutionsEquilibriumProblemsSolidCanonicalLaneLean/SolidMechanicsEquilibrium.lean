import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundsSolutionsEquilibriumProblemsSolidCanonicalLaneLean

structure SolidMechanicsPackage where
  deformationGradient : Type
  stressTensor : Type
  equilibriumEquation : Prop
  constitutiveLaw : Prop
  boundaryConditions : Prop

structure SolidMechanicsEvidence where
  equilibriumClosed : Prop
  constitutiveClosed : Prop
  bcClosed : Prop

def SolidMechanicsClosed (S : SolidMechanicsPackage) : Prop :=
  S.equilibriumEquation ∧ S.constitutiveLaw ∧ S.boundaryConditions

theorem solid_mechanics_closed (S : SolidMechanicsPackage) (E : SolidMechanicsEvidence) :
    SolidMechanicsClosed S :=
  And.intro E.equilibriumClosed (And.intro E.constitutiveClosed E.bcClosed)

end BoundsSolutionsEquilibriumProblemsSolidCanonicalLaneLean
end HautevilleHouse