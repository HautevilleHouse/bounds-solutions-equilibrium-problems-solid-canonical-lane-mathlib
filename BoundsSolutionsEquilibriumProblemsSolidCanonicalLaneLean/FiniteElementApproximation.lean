import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundsSolutionsEquilibriumProblemsSolidCanonicalLaneLean

structure FiniteElementPackage where
  mesh : Type
  basisFunctions : Type
  stiffnessMatrix : Type
  loadVector : Type
  convergenceEstimate : Prop

structure FiniteElementEvidence where
  convergenceClosed : Prop

def FiniteElementClosed (F : FiniteElementPackage) : Prop :=
  F.convergenceEstimate

theorem finite_element_closed (F : FiniteElementPackage) (E : FiniteElementEvidence) :
    FiniteElementClosed F :=
  E.convergenceClosed

end BoundsSolutionsEquilibriumProblemsSolidCanonicalLaneLean
end HautevilleHouse