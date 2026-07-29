import BoundsSolutionsEquilibriumProblemsSolidCanonicalLaneLean.SemismoothNewtonMethod

/-!
# Complementarity Problem Package
-/

namespace HautevilleHouse
namespace BoundsSolutionsEquilibriumProblemsSolidCanonicalLaneLean

structure ComplementarityProblemPackage {G : RiemannianCurvaturePackage}
    {E : EquilibriumVariationalInequalityPackage G}
    (S : SemismoothNewtonMethodPackage E) where
  functionDefinition : Prop
  coneConstraint : Prop
  complementarityCondition : Prop
  solutionRegularity : Prop

structure ComplementarityProblemEvidence {G : RiemannianCurvaturePackage}
    {E : EquilibriumVariationalInequalityPackage G}
    {S : SemismoothNewtonMethodPackage E} (C : ComplementarityProblemPackage S) where
  functionDefinitionClosed : C.functionDefinition
  coneConstraintClosed : C.coneConstraint
  complementarityConditionClosed : C.complementarityCondition
  solutionRegularityClosed : C.solutionRegularity

def ComplementarityProblemClosed {G : RiemannianCurvaturePackage}
    {E : EquilibriumVariationalInequalityPackage G}
    {S : SemismoothNewtonMethodPackage E} (C : ComplementarityProblemPackage S) : Prop :=
  C.functionDefinition ∧ C.coneConstraint ∧ C.complementarityCondition ∧ C.solutionRegularity

theorem complementarity_problem_closed_from_evidence
    {G : RiemannianCurvaturePackage} {E : EquilibriumVariationalInequalityPackage G}
    {S : SemismoothNewtonMethodPackage E} (C : ComplementarityProblemPackage S)
    (Ev : ComplementarityProblemEvidence C) : ComplementarityProblemClosed C := by
  exact And.intro Ev.functionDefinitionClosed
    (And.intro Ev.coneConstraintClosed
      (And.intro Ev.complementarityConditionClosed Ev.solutionRegularityClosed))

end BoundsSolutionsEquilibriumProblemsSolidCanonicalLaneLean
end HautevilleHouse
