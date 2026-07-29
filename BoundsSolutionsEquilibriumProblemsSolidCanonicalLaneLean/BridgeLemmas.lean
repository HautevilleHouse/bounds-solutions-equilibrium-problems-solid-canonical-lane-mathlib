import canonicalLaneMathlib.BridgeLemmas

namespace HautevilleHouse
namespace BoundsSolutionsEquilibriumProblemsSolidCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  bridgeClosed A

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact bridgeClosed A

end BoundsSolutionsEquilibriumProblemsSolidCanonicalLaneLean
end HautevilleHouse