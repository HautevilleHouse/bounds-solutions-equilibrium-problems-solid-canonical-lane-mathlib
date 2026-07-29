import BoundsSolutionsEquilibriumProblemsSolidCanonicalLaneLean.BoundsPackage

/-!
# Solution Existence Package
-/

namespace HautevilleHouse
namespace BoundsSolutionsEquilibriumProblemsSolidCanonicalLaneLean

structure SolutionExistencePackage (B : BoundsPackage) where
  solutionSpace : Type u
  existenceTheorem : Prop
  uniquenessTheorem : Prop
  continuousDependence : Prop

structure SolutionExistenceEvidence {B : BoundsPackage}
    (S : SolutionExistencePackage B) where
  existenceTheoremClosed : S.existenceTheorem
  uniquenessTheoremClosed : S.uniquenessTheorem
  continuousDependenceClosed : S.continuousDependence

def SolutionExistenceClosed {B : BoundsPackage}
    (S : SolutionExistencePackage B) : Prop :=
  S.existenceTheorem ∧ S.uniquenessTheorem ∧ S.continuousDependence

theorem solution_existence_closed_from_evidence
    {B : BoundsPackage} (S : SolutionExistencePackage B)
    (E : SolutionExistenceEvidence S) : SolutionExistenceClosed S := by
  exact And.intro E.existenceTheoremClosed
    (And.intro E.uniquenessTheoremClosed E.continuousDependenceClosed)

end BoundsSolutionsEquilibriumProblemsSolidCanonicalLaneLean
end HautevilleHouse