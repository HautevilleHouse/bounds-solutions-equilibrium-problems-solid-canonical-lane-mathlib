import BoundsSolutionsEquilibriumProblemsSolidCanonicalLaneLean.BoundsSolutionExistence

namespace HautevilleHouse
namespace BoundsSolutionsEquilibriumProblemsSolidCanonicalLaneLean

structure VariationalInequalityPackage {P : ElasticEquilibriumPackage} {EP : ElasticEquilibriumEvidence P} (B : BoundsSolutionExistencePackage EP) where
  convexSubset : Type
  inequalityFormulation : Prop
  monotonicity : Prop
  solutionCharacterization : Prop
  inequalityFormulationClosed : inequalityFormulation
  monotonicityClosed : monotonicity
  solutionCharacterizationClosed : solutionCharacterization

structure VariationalInequalityEvidence {P : ElasticEquilibriumPackage} {EP : ElasticEquilibriumEvidence P} {B : BoundsSolutionExistencePackage EP} (V : VariationalInequalityPackage B) where
  inequalityFormulationClosed : V.inequalityFormulation
  monotonicityClosed : V.monotonicity
  solutionCharacterizationClosed : V.solutionCharacterization

def VariationalInequalityClosed {P : ElasticEquilibriumPackage} {EP : ElasticEquilibriumEvidence P} {B : BoundsSolutionExistencePackage EP} (V : VariationalInequalityPackage B) : Prop :=
  V.inequalityFormulation ∧ V.monotonicity ∧ V.solutionCharacterization

theorem variational_inequality_closed_from_evidence {P : ElasticEquilibriumPackage} {EP : ElasticEquilibriumEvidence P} {B : BoundsSolutionExistencePackage EP} (V : VariationalInequalityPackage B) (E : VariationalInequalityEvidence V) : VariationalInequalityClosed V := by
  exact And.intro E.inequalityFormulationClosed (And.intro E.monotonicityClosed E.solutionCharacterizationClosed)

end BoundsSolutionsEquilibriumProblemsSolidCanonicalLaneLean
end HautevilleHouse
