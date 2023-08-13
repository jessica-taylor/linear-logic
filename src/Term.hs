module Term where


import Data.Map as Map
import qualified Data.Map as Map

data Var = DeBrunh Int
         | Named String

data IType = IUnit               -- true
           | IVoid               -- false
           | IVar Var            -- variable of intuitionistic type context
           | IForall IType IType -- dependent product
           | ISum IType IType    -- dependent sum
           | IUniversal IType    -- type forall

data LType = LUnit                 -- nothing
           | LVoid                 -- impossible
           | LVar Var              -- variable of linear type context
           | LProd LType LType     -- linear product
           | LImpl LType LType     -- linear implication
           | LExp LType            -- linear exponentiation
           | LIForall IType LType  -- dependent product (on intuitionistic value)
           | LIUniversal LType     -- intuitionistic type forall
           | LLUniversal LType     -- linear type forall
           | LIType IType          -- intuitionistic type

data ITerm = ITUnit                -- unit value
           | ITVar Var             -- variable of intuitionistic value context
           | ITLambda IType ITerm  -- dependent lambda with a typed argument
           | ITPair ITerm ITerm    -- dependent pair (automatically typed)
           | ITUniversal ITerm     -- type forall

data LTerm = LTUnit                -- unit value
           | LTVar Var             -- variable of linear value context
           | LTPair LTerm LTerm    -- linear non-dependent pair
           | LTLambda LType LTerm  -- non-dependent lambda with a typed linear argument
           | LTReplicate LTerm     -- linear exponential
           | LTILambda IType LTerm -- dependent lambda with a typed intuitionistic argument
           | LTIUniversal LTerm    -- intuitonistic type forall
           | LTLUniversal LTerm    -- linear type forall
           | LTITerm ITerm         -- intuitionistic value


data Ctx t = Ctx [t] (Map String t)
