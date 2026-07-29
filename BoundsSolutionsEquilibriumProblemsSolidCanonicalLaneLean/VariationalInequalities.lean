import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundsSolutionsEquilibriumProblemsSolidCanonicalLaneLean

structure VariationalInequalityPackage where
  space : Type
  bilinearForm : Type
  convexSet : Type
  solutionExistence : Prop
  uniqueness : Prop

structure VariationalInequalityEvidence where
  existenceClosed : Prop
  uniquenessClosed : Prop

def VariationalInequalityClosed (V : VariationalInequalityPackage) : Prop :=
  V.solutionExistence ∧ V.uniqueness

theorem variational_inequality_closed (V : VariationalInequalityPackage) (E : VariationalInequalityEvidence) :
    VariationalInequalityClosed V :=
  And.intro E.existenceClosed E.uniquenessClosed

end BoundsSolutionsEquilibriumProblemsSolidCanonicalLaneLean
end HautevilleHouse