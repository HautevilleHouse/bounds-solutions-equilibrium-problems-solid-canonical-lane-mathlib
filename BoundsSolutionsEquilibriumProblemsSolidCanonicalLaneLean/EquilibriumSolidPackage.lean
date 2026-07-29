import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundsSolutionsEquilibriumProblemsSolidCanonicalLaneLean

structure EquilibriumPackage where
  variationalInequality : Set ℝ → Set ℝ → Prop
  equilibriumPoint : ℝ
  equilibriumCondition : Prop
  monotonicity : Prop

structure EquilibriumEvidence (E : EquilibriumPackage) where
  equilibriumConditionClosed : E.equilibriumCondition
  monotonicityClosed : E.monotonicity

def EquilibriumClosed (E : EquilibriumPackage) : Prop :=
  E.equilibriumCondition ∧ E.monotonicity

theorem equilibrium_closed_from_evidence (E : EquilibriumPackage) (E_ev : EquilibriumEvidence E) :
    EquilibriumClosed E := by
  exact And.intro E_ev.equilibriumConditionClosed E_ev.monotonicityClosed

structure SolidPackage where
  setS : Set ℝ
  solidProperty : Set.Internal solidProperty setS
  interiorNonempty : (interior setS).Nonempty
  closureRelation : closure setS = setS

structure SolidEvidence (S : SolidPackage) where
  solidPropertyClosed : Set.Internal S.solidProperty S.setS
  interiorNonemptyClosed : (interior S.setS).Nonempty
  closureRelationClosed : closure S.setS = S.setS

def SolidClosed (S : SolidPackage) : Prop :=
  Set.Internal S.solidProperty S.setS ∧ (interior S.setS).Nonempty ∧ closure S.setS = S.setS

theorem solid_closed_from_evidence (S : SolidPackage) (E : SolidEvidence S) :
    SolidClosed S := by
  exact And.intro E.solidPropertyClosed (And.intro E.interiorNonemptyClosed E.closureRelationClosed)

end BoundsSolutionsEquilibriumProblemsSolidCanonicalLaneLean
end HautevilleHouse