import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundsSolutionsEquilibriumProblemsSolidCanonicalLaneLean

structure SolidConstraintsPackage (A : AdmissibleClass) where
  displacementConstraint : Prop
  stressConstraint : Prop
  volumeConstraint : Prop
  displacementConstraintClosed : displacementConstraint
  stressConstraintClosed : stressConstraint
  volumeConstraintClosed : volumeConstraint

structure SolidConstraintsEvidence (A : AdmissibleClass) (S : SolidConstraintsPackage A) where
  displacementConstraintClosed : S.displacementConstraint
  stressConstraintClosed : S.stressConstraint
  volumeConstraintClosed : S.volumeConstraint

def SolidConstraintsClosed (A : AdmissibleClass) (S : SolidConstraintsPackage A) : Prop :=
  S.displacementConstraint ∧ S.stressConstraint ∧ S.volumeConstraint

theorem solid_constraints_closed_from_evidence (A : AdmissibleClass) (S : SolidConstraintsPackage A) (E : SolidConstraintsEvidence A S) : SolidConstraintsClosed A S :=
  And.intro E.displacementConstraintClosed (And.intro E.stressConstraintClosed E.volumeConstraintClosed)

end BoundsSolutionsEquilibriumProblemsSolidCanonicalLaneLean
end HautevilleHouse