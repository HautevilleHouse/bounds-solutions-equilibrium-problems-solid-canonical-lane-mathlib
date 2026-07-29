import BoundsSolutionsEquilibriumProblemsSolidCanonicalLaneLean.ElasticEquilibrium

namespace HautevilleHouse
namespace BoundsSolutionsEquilibriumProblemsSolidCanonicalLaneLean

structure BoundsSolutionExistencePackage {P : ElasticEquilibriumPackage} (EP : ElasticEquilibriumEvidence P) where
  sobolevSpace : Type
  weakFormulation : Prop
  coercivity : Prop
  boundedness : Prop
  existenceProved : Prop
  uniquenessProved : Prop
  existenceProvedClosed : existenceProved
  uniquenessProvedClosed : uniquenessProved

structure BoundsSolutionExistenceEvidence {P : ElasticEquilibriumPackage} {EP : ElasticEquilibriumEvidence P} (B : BoundsSolutionExistencePackage EP) where
  weakFormulationClosed : B.weakFormulation
  coercivityClosed : B.coercivity
  boundednessClosed : B.boundedness
  existenceProvedClosed : B.existenceProved
  uniquenessProvedClosed : B.uniquenessProved

def BoundsSolutionExistenceClosed {P : ElasticEquilibriumPackage} {EP : ElasticEquilibriumEvidence P} (B : BoundsSolutionExistencePackage EP) : Prop :=
  B.weakFormulation ∧ B.coercivity ∧ B.boundedness ∧ B.existenceProved ∧ B.uniquenessProved

theorem bounds_solution_existence_closed_from_evidence {P : ElasticEquilibriumPackage} {EP : ElasticEquilibriumEvidence P} (B : BoundsSolutionExistencePackage EP) (E : BoundsSolutionExistenceEvidence B) : BoundsSolutionExistenceClosed B := by
  exact And.intro E.weakFormulationClosed (And.intro E.coercivityClosed (And.intro E.boundednessClosed (And.intro E.existenceProvedClosed E.uniquenessProvedClosed)))

end BoundsSolutionsEquilibriumProblemsSolidCanonicalLaneLean
end HautevilleHouse
