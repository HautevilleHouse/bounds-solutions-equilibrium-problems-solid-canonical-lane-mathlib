import BoundsSolutionsEquilibriumProblemsSolidCanonicalLaneLean.TheoremStatement
import BoundsSolutionsEquilibriumProblemsSolidCanonicalLaneLean.CanonicalLaneMathlibCore
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace BoundsSolutionsEquilibriumProblemsSolidCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure BoundsSolutionsSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure BoundsSolutionsAdmittedObject where
  space : BoundsSolutionsSpace
  boundConstraints : Prop
  equilibriumCondition : Prop
  solidStructure : Prop
  conclusion : solidStructure

structure BoundsSolutionsEndgameState where
  object : BoundsSolutionsAdmittedObject

def BoundsSolutionsWitnessClosed (O : BoundsSolutionsAdmittedObject) : Prop :=
  O.solidStructure

end BoundsSolutionsEquilibriumProblemsSolidCanonicalLaneLean
end HautevilleHouse
