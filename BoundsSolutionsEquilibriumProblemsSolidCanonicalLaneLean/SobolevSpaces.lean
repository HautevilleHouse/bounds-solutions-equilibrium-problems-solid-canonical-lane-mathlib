import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundsSolutionsEquilibriumProblemsSolidCanonicalLaneLean

structure SobolevSpacePackage where
  domain : Type
  exponent : ℝ
  normDefined : Prop
  completeness : Prop

structure SobolevEmbeddingEvidence where
  sobolevInequality : Prop
  compactEmbedding : Prop
  embeddingClosed : sobolevInequality ∧ compactEmbedding

def SobolevSpaceClosed (S : SobolevSpacePackage) : Prop :=
  S.normDefined ∧ S.completeness

theorem sobolev_space_closed (S : SobolevSpacePackage) (E : SobolevEmbeddingEvidence) :
    SobolevSpaceClosed S :=
  And.intro S.normDefined S.completeness

end BoundsSolutionsEquilibriumProblemsSolidCanonicalLaneLean
end HautevilleHouse