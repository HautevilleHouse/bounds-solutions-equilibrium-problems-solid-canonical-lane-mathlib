import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundsSolutionsEquilibriumProblemsSolidCanonicalLaneLean

structure BoundsSolutionsEquilibriumProblemsSolidAdmittedObject where
  space : Type
  topology : TopologicalSpace space
  solutionClosed : Prop
  boundSatisfied : Prop
  equilibriumReached : Prop
  conclusion : solutionClosed ∧ boundSatisfied ∧ equilibriumReached

def BoundsSolutionsEquilibriumProblemsSolidWitnessClosed (O : BoundsSolutionsEquilibriumProblemsSolidAdmittedObject) : Prop :=
  O.solutionClosed ∧ O.boundSatisfied ∧ O.equilibriumReached

end BoundsSolutionsEquilibriumProblemsSolidCanonicalLaneLean
end HautevilleHouse
