import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundsSolutionsEquilibriumProblemsSolidCanonicalLaneLean

structure BoundaryValueState where
  domain : Type
  boundary : Type
  equilibriumData : Type
  solutionSpace : Type

structure AdmittedBoundaryObject where
  state : BoundaryValueState
  wellPosed : Prop
  boundSatisfied : Prop
  conclusion : boundSatisfied

def BoundWitnessClosed (O : AdmittedBoundaryObject) : Prop :=
  O.boundSatisfied

end BoundsSolutionsEquilibriumProblemsSolidCanonicalLaneLean
end HautevilleHouse