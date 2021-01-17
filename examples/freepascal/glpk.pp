unit glpk;
interface
  {$MODE ObjFPC}

  const
    {$IFDEF LINUX}
    GLPKLIB = 'libglpk';
    {$ELSE}
    GLPKLIB = 'glpk_4_65.dll';
    {$ENDIF}
{
  Translated from glpk.h by Ruben Chaer@20201216
  con la ayuda de h2pas de freepascal

Instalación de la librería glpk
En ubuntu ejcutar
  sudo apt install libglpk-dev

En windows copiar glpk_4_65.dll al direcotrio de ejecución

}

  Type
      size_t = UInt32;

      { MathProg translator workspace  }
      { graph descriptor  }
      { DMP *pool;  }
      { memory pool to store graph components  }
      { graph name (1 to 255 chars); NULL means no name is assigned
               to the graph  }
      { length of the vertex list (enlarged automatically)  }
      { number of vertices in the graph, 0 <= nv <= nv_max  }
      { number of arcs in the graph, na >= 0  }
      { glp_vertex *v[1+nv_max];  }
      { v[i], 1 <= i <= nv, is a pointer to i-th vertex  }
      { AVL *index;  }
      { vertex index to find vertices by their names; NULL means the
               index does not exist  }
      { size of data associated with each vertex (0 to 256 bytes)  }
      { size of data associated with each arc (0 to 256 bytes)  }
        glp_graph = record
            pool : pointer;
            name : ^char;
            nv_max : longint;
            nv : longint;
            na : longint;
            v : ^Pglp_vertex;
            index : pointer;
            v_size : longint;
            a_size : longint;
          end;

      { vertex descriptor  }
      { vertex ordinal number, 1 <= i <= nv  }
      { vertex name (1 to 255 chars); NULL means no name is assigned
               to the vertex  }
      { AVLNODE *entry;  }
      { pointer to corresponding entry in the vertex index; NULL means
               that either the index does not exist or the vertex has no name
               assigned  }
      { pointer to data associated with the vertex  }
      { working pointer  }
      { pointer to the (unordered) list of incoming arcs  }
      { pointer to the (unordered) list of outgoing arcs  }
        glp_vertex = record
            i : longint;
            name : ^char;
            entry : pointer;
            data : pointer;
            temp : pointer;
            in_ : ^glp_arc;
            out_ : ^glp_arc;
          end;

      { arc descriptor  }
      { pointer to the tail endpoint  }
      { pointer to the head endpoint  }
      { pointer to data associated with the arc  }
      { working pointer  }
      { pointer to previous arc having the same tail endpoint  }
      { pointer to next arc having the same tail endpoint  }
      { pointer to previous arc having the same head endpoint  }
      { pointer to next arc having the same head endpoint  }
        glp_arc = record
            tail : ^glp_vertex;
            head : ^glp_vertex;
            data : pointer;
            temp : pointer;
            t_prev : ^glp_arc;
            t_next : ^glp_arc;
            h_prev : ^glp_arc;
            h_next : ^glp_arc;
          end;

    glp_attr = record
        level : longint;
        origin : longint;
        klass : longint;
        foo_bar : array[0..6] of double;
      end;

    glp_bfcp = record
        msg_lev : longint;
        _type : longint;
        lu_size : longint;
        piv_tol : double;
        piv_lim : longint;
        suhl : longint;
        eps_tol : double;
        max_gro : double;
        nfs_max : longint;
        upd_tol : double;
        nrs_max : longint;
        rs_size : longint;
        foo_bar : array[0..37] of double;
      end;


    // typedef struct glp_mir glp_mir;
     glp_mir = pointer;
   { MIR cut generator workspace  }

    // typedef struct glp_cfg glp_cfg;
     glp_cfg = pointer;
   { conflict graph descriptor  }

//    typedef struct glp_cov glp_cov;
   { cover cur generator workspace }
     glp_cov = pointer;


//     #if 1 /* 10/XII-2017 */
//     typedef struct glp_prep glp_prep;
     glp_prep = pointer;
     { LP/MIP preprocessor workspace }
//     #endif


// typedef struct glp_prob glp_prob;
{ LP/MIP problem object }
    glp_prob = pointer;

//    typedef struct glp_tran glp_tran;
  { MathProg translator workspace }
   glp_tran = pointer;

//   typedef struct glp_tree glp_tree;
   { branch-and-bound tree }
   glp_tree = pointer;

     glp_mpscp = record
         blank : longint;
         obj_name : ^char;
         tol_mps : double;
         foo_bar : array[0..16] of double;
       end;
   { CPLEX LP format control parameters  }
   { (reserved for use in the future)  }

     glp_cpxcp = record
         foo_bar : array[0..19] of double;
       end;

     glp_smcp = record
             msg_lev : longint;
             meth : longint;
             pricing : longint;
             r_test : longint;
             tol_bnd : double;
             tol_dj : double;
             tol_piv : double;
             obj_ll : double;
             obj_ul : double;
             it_lim : longint;
             tm_lim : longint;
             out_frq : longint;
             out_dly : longint;
             presolve : longint;
             excl : longint;
             shift : longint;
             aorn : longint;
             foo_bar : array[0..32] of double;
           end;

  Pchar  = ^char;
  Pdouble  = ^double;
  Pglp_arc  = ^glp_arc;
  Pglp_attr  = ^glp_attr;
  Pglp_bfcp  = ^glp_bfcp;
  Pglp_cfg  = ^glp_cfg;
  Pglp_cov  = ^glp_cov;
  Pglp_cpxcp  = ^glp_cpxcp;
  Pglp_graph  = ^glp_graph;
  Pglp_iocp  = ^glp_iocp;
  Pglp_iptcp  = ^glp_iptcp;
  Pglp_mir  = ^glp_mir;
  Pglp_mpscp  = ^glp_mpscp;
  Pglp_prep  = ^glp_prep;
  Pglp_prob  = ^glp_prob;
  Pglp_smcp  = ^glp_smcp;
  Pglp_tran  = ^glp_tran;
  Pglp_tree  = ^glp_tree;
  Plongint  = ^longint;
  Psize_t  = ^size_t;
  Pglp_vertex = ^glp_vertex;

  glp_iptcp = record
      msg_lev : longint;
      ord_alg : longint;
      foo_bar : array[0..47] of double;
    end;

  glp_iocp = record
      msg_lev : longint;
      br_tech : longint;
      bt_tech : longint;
      tol_int : double;
      tol_obj : double;
      tm_lim : longint;
      out_frq : longint;
      out_dly : longint;
      cb_func : procedure (T:Pglp_tree; info:pointer);cdecl;
      cb_info : pointer;
      cb_size : longint;
      pp_tech : longint;
      mip_gap : double;
      mir_cuts : longint;
      gmi_cuts : longint;
      cov_cuts : longint;
      clq_cuts : longint;
      presolve : longint;
      binarize : longint;
      fp_heur : longint;
      ps_heur : longint;
      ps_tm_lim : longint;
      sr_heur : longint;
      use_sol : longint;
      save_sol : ^char;
      alien : longint;
      flip : longint;
      foo_bar : array[0..22] of double;
    end;

  TTermHook =  function (info:pointer; s:Pchar):longint;
  TErrorHook =  procedure (info:pointer);

  TArr16LongInt = array[0..(1+15)-1] of longint;
  TArr14LongInt = array[0..(1+14)-1] of longint;
  TArr5LongInt = array[0..(1+5)-1] of longint;
  {$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


  { glpk.h  }
  {**********************************************************************
  *  This code is part of GLPK (GNU Linear Programming Kit).
  *
  *  Copyright (C) 2000-2018 Andrew Makhorin, Department for Applied
  *  Informatics, Moscow Aviation Institute, Moscow, Russia. All rights
  *  reserved. E-mail: <mao@gnu.org>.
  *
  *  GLPK is free software: you can redistribute it and/or modify it
  *  under the terms of the GNU General Public License as published by
  *  the Free Software Foundation, either version 3 of the License, or
  *  (at your option) any later version.
  *
  *  GLPK is distributed in the hope that it will be useful, but WITHOUT
  *  ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
  *  or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public
  *  License for more details.
  *
  *  You should have received a copy of the GNU General Public License
  *  along with GLPK. If not, see <http://www.gnu.org/licenses/>.
  ********************************************************************** }
{$ifndef GLPK_H}
{$define GLPK_H}  
{//include <stdarg.h>}
{//include <stddef.h>}
{ C++ extern C conditionnal removed }
  { library version numbers:  }

  const
    GLP_MAJOR_VERSION = 4;    
    GLP_MINOR_VERSION = 65;    

  { LP/MIP problem object  }
  { optimization direction flag:  }
  { minimization  }

  const
    GLP_MIN = 1;    
  { maximization  }
    GLP_MAX = 2;    
  { kind of structural variable:  }
  { continuous variable  }
    GLP_CV = 1;    
  { integer variable  }
    GLP_IV = 2;    
  { binary variable  }
    GLP_BV = 3;    
  { type of auxiliary/structural variable:  }
  { free (unbounded) variable  }
    GLP_FR = 1;    
  { variable with lower bound  }
    GLP_LO = 2;    
  { variable with upper bound  }
    GLP_UP = 3;    
  { double-bounded variable  }
    GLP_DB = 4;    
  { fixed variable  }
    GLP_FX = 5;    
  { status of auxiliary/structural variable:  }
  { basic variable  }
    GLP_BS = 1;    
  { non-basic variable on lower bound  }
    GLP_NL = 2;    
  { non-basic variable on upper bound  }
    GLP_NU = 3;    
  { non-basic free (unbounded) variable  }
    GLP_NF = 4;    
  { non-basic fixed variable  }
    GLP_NS = 5;    
  { scaling options:  }
  { perform geometric mean scaling  }
    GLP_SF_GM = $01;    
  { perform equilibration scaling  }
    GLP_SF_EQ = $10;    
  { round scale factors to power of two  }
    GLP_SF_2N = $20;    
  { skip if problem is well scaled  }
    GLP_SF_SKIP = $40;    
  { choose scaling options automatically  }
    GLP_SF_AUTO = $80;    
  { solution indicator:  }
  { basic solution  }
    GLP_SOL = 1;    
  { interior-point solution  }
    GLP_IPT = 2;    
  { mixed integer solution  }
    GLP_MIP = 3;    
  { solution status:  }
  { solution is undefined  }
    GLP_UNDEF = 1;    
  { solution is feasible  }
    GLP_FEAS = 2;    
  { solution is infeasible  }
    GLP_INFEAS = 3;    
  { no feasible solution exists  }
    GLP_NOFEAS = 4;    
  { solution is optimal  }
    GLP_OPT = 5;    
  { solution is unbounded  }
    GLP_UNBND = 6;    
{ if 1 /* 05/III-2014 */}
  { plain LU-factorization  }

  const
    GLP_BF_LUF = $00;    
  { block triangular LU-factorization  }
    GLP_BF_BTF = $10;    
{ endif}
  { Forrest-Tomlin (LUF only)  }

  const
    GLP_BF_FT = $01;    
  { Schur compl. + Bartels-Golub  }
    GLP_BF_BG = $02;    
  { Schur compl. + Givens rotation  }
    GLP_BF_GR = $03;    
  { basis factorization control parameters  }
  { (not used)  }
  { factorization type:  }
  { (not used)  }
  { sgf_piv_tol  }
  { sgf_piv_lim  }
  { sgf_suhl  }
  { sgf_eps_tol  }
  { (not used)  }
  { fhvint.nfs_max  }
  { (not used)  }
  { scfint.nn_max  }
  { (not used)  }
  { (reserved)  }

  { no output  }

  const
    GLP_MSG_OFF = 0;
  { warning and error messages only  }
    GLP_MSG_ERR = 1;    
  { normal output  }
    GLP_MSG_ON = 2;    
  { full output  }
    GLP_MSG_ALL = 3;    
  { debug output  }
    GLP_MSG_DBG = 4;    
  { use primal simplex  }
    GLP_PRIMAL = 1;    
  { use dual; if it fails, use primal  }
    GLP_DUALP = 2;    
  { use dual simplex  }
    GLP_DUAL = 3;    
  { standard (Dantzig's rule)  }
    GLP_PT_STD = $11;    
  { projected steepest edge  }
    GLP_PT_PSE = $22;    
  { standard (textbook)  }
    GLP_RT_STD = $11;    
  { Harris' two-pass ratio test  }
    GLP_RT_HAR = $22;    
{ if 1 /* 16/III-2016 */}
  { long-step (flip-flop) ratio test  }

  const
    GLP_RT_FLIP = $33;    
{ endif}
{ if 1 /* 11/VII-2017 (not documented yet) */}
  { use A matrix in row-wise format  }

  const
    GLP_USE_AT = 1;    
  { use N matrix in row-wise format  }
    GLP_USE_NT = 2;    
{ endif}
  { simplex solver control parameters  }
  { message level:  }
  { simplex method option:  }
  { pricing technique:  }
  { ratio test technique:  }
  { primal feasibility tolerance  }
  { dual feasibility tolerance  }
  { pivot tolerance  }
  { lower objective limit  }
  { upper objective limit  }
  { simplex iteration limit  }
  { time limit, ms  }
  { display output frequency, ms  }
  { display output delay, ms  }
  { enable/disable using LP presolver  }
{ if 1 /* 11/VII-2017 (not documented yet) */}
  { exclude fixed non-basic variables  }
  { shift bounds of variables to zero  }
  { option to use A or N:  }
  { (reserved)  }


  { natural (original) ordering  }

  const
    GLP_ORD_NONE = 0;    
  { quotient minimum degree (QMD)  }
    GLP_ORD_QMD = 1;    
  { approx. minimum degree (AMD)  }
    GLP_ORD_AMD = 2;    
  { approx. minimum degree (SYMAMD)  }
    GLP_ORD_SYMAMD = 3;    
  { interior-point solver control parameters  }
  { message level (see glp_smcp)  }
  { ordering algorithm:  }
  { (reserved)  }

  { branch-and-bound tree  }
  { first fractional variable  }

  const
    GLP_BR_FFV = 1;    
  { last fractional variable  }
    GLP_BR_LFV = 2;    
  { most fractional variable  }
    GLP_BR_MFV = 3;    
  { heuristic by Driebeck and Tomlin  }
    GLP_BR_DTH = 4;    
  { hybrid pseudocost heuristic  }
    GLP_BR_PCH = 5;    
  { depth first search  }
    GLP_BT_DFS = 1;    
  { breadth first search  }
    GLP_BT_BFS = 2;    
  { best local bound  }
    GLP_BT_BLB = 3;    
  { best projection heuristic  }
    GLP_BT_BPH = 4;    
  { disable preprocessing  }
    GLP_PP_NONE = 0;    
  { preprocessing only on root level  }
    GLP_PP_ROOT = 1;    
  { preprocessing on all levels  }
    GLP_PP_ALL = 2;    
  { integer optimizer control parameters  }
  { message level (see glp_smcp)  }
  { branching technique:  }
  { backtracking technique:  }
  { mip.tol_int  }
  { mip.tol_obj  }
  { mip.tm_lim (milliseconds)  }
  { mip.out_frq (milliseconds)  }
  { mip.out_dly (milliseconds)  }
  { mip.cb_func  }
  { mip.cb_info  }
  { mip.cb_size  }
  { preprocessing technique:  }
  { relative MIP gap tolerance  }
  { MIR cuts       (GLP_ON/GLP_OFF)  }
  { Gomory's cuts  (GLP_ON/GLP_OFF)  }
  { cover cuts     (GLP_ON/GLP_OFF)  }
  { clique cuts    (GLP_ON/GLP_OFF)  }
  { enable/disable using MIP presolver  }
  { try to binarize integer variables  }
  { feasibility pump heuristic  }
  { proximity search heuristic  }
  { proxy time limit, milliseconds  }
  { simple rounding heuristic  }
{ if 1 /* 24/X-2015; not documented--should not be used */}
  { use existing solution  }
(* Const before type ignored *)
  { filename to save every new solution  }
  { use alien solver  }
{ endif}
{ if 1 /* 16/III-2016; not documented--should not be used */}
  { use long-step dual simplex  }
{ endif}
  { (reserved)  }

  { regular constraint  }

  const
    GLP_RF_REG = 0;    
  { "lazy" constraint  }
    GLP_RF_LAZY = 1;    
  { cutting plane constraint  }
    GLP_RF_CUT = 2;    
  { Gomory's mixed integer cut  }
    GLP_RF_GMI = 1;    
  { mixed integer rounding cut  }
    GLP_RF_MIR = 2;    
  { mixed cover cut  }
    GLP_RF_COV = 3;    
  { clique cut  }
    GLP_RF_CLQ = 4;    
  { additional row attributes  }
  { subproblem level at which the row was added  }
  { row origin flag:  }
  { row class descriptor:  }
  { (reserved)  }

  { enable/disable flag:  }
  { enable something  }

  const
    GLP_ON = 1;    
  { disable something  }
    GLP_OFF = 0;    
  { reason codes:  }
  { request for row generation  }
    GLP_IROWGEN = $01;    
  { better integer solution found  }
    GLP_IBINGO = $02;    
  { request for heuristic solution  }
    GLP_IHEUR = $03;    
  { request for cut generation  }
    GLP_ICUTGEN = $04;    
  { request for branching  }
    GLP_IBRANCH = $05;    
  { request for subproblem selection  }
    GLP_ISELECT = $06;    
  { request for preprocessing  }
    GLP_IPREPRO = $07;    
  { branch selection indicator:  }
  { select no branch  }
    GLP_NO_BRNCH = 0;    
  { select down-branch  }
    GLP_DN_BRNCH = 1;    
  { select up-branch  }
    GLP_UP_BRNCH = 2;    
  { return codes:  }
  { invalid basis  }
    GLP_EBADB = $01;    
  { singular matrix  }
    GLP_ESING = $02;    
  { ill-conditioned matrix  }
    GLP_ECOND = $03;    
  { invalid bounds  }
    GLP_EBOUND = $04;    
  { solver failed  }
    GLP_EFAIL = $05;    
  { objective lower limit reached  }
    GLP_EOBJLL = $06;    
  { objective upper limit reached  }
    GLP_EOBJUL = $07;    
  { iteration limit exceeded  }
    GLP_EITLIM = $08;    
  { time limit exceeded  }
    GLP_ETMLIM = $09;    
  { no primal feasible solution  }
    GLP_ENOPFS = $0A;    
  { no dual feasible solution  }
    GLP_ENODFS = $0B;    
  { root LP optimum not provided  }
    GLP_EROOT = $0C;    
  { search terminated by application  }
    GLP_ESTOP = $0D;    
  { relative mip gap tolerance reached  }
    GLP_EMIPGAP = $0E;    
  { no primal/dual feasible solution  }
    GLP_ENOFEAS = $0F;    
  { no convergence  }
    GLP_ENOCVG = $10;    
  { numerical instability  }
    GLP_EINSTAB = $11;    
  { invalid data  }
    GLP_EDATA = $12;    
  { result out of range  }
    GLP_ERANGE = $13;    
  { condition indicator:  }
  { primal equalities  }
    GLP_KKT_PE = 1;    
  { primal bounds  }
    GLP_KKT_PB = 2;    
  { dual equalities  }
    GLP_KKT_DE = 3;    
  { dual bounds  }
    GLP_KKT_DB = 4;    
  { complementary slackness  }
    GLP_KKT_CS = 5;    
  { MPS file format:  }
  { fixed (ancient)  }
    GLP_MPS_DECK = 1;    
  { free (modern)  }
    GLP_MPS_FILE = 2;    
  { MPS format control parameters  }
  { character code to replace blanks in symbolic names  }
  { objective row name  }
  { zero tolerance for MPS data  }
  { (reserved for use in the future)  }

{ if 1 /* 10/XII-2017 */}

  { LP/MIP preprocessor workspace  }
{ endif}

  function glp_create_prob: Pglp_prob;

  { create problem object  }
(* Const before type ignored *)
  procedure glp_set_prob_name(P:Pglp_prob; name:Pchar);

  { assign (change) problem name  }
(* Const before type ignored *)
  procedure glp_set_obj_name(P:Pglp_prob; name:Pchar);

  { assign (change) objective function name  }
  procedure glp_set_obj_dir(P:Pglp_prob; dir:longint);

  { set (change) optimization direction flag  }
  function glp_add_rows(P:Pglp_prob; nrs:longint):longint;

  { add new rows to problem object  }
  function glp_add_cols(P:Pglp_prob; ncs:longint):longint;

  { add new columns to problem object  }
(* Const before type ignored *)
  procedure glp_set_row_name(P:Pglp_prob; i:longint; name:Pchar);

  { assign (change) row name  }
(* Const before type ignored *)
  procedure glp_set_col_name(P:Pglp_prob; j:longint; name:Pchar);

  { assign (change) column name  }
  procedure glp_set_row_bnds(P:Pglp_prob; i:longint; _type:longint; lb:double; ub:double);

  { set (change) row bounds  }
  procedure glp_set_col_bnds(P:Pglp_prob; j:longint; _type:longint; lb:double; ub:double);

  { set (change) column bounds  }
  procedure glp_set_obj_coef(P:Pglp_prob; j:longint; coef:double);

  { set (change) obj. coefficient or constant term  }
(* Const before type ignored *)
(* Const before type ignored *)
  procedure glp_set_mat_row(P:Pglp_prob; i:longint; len:longint; ind:Plongint; val:Pdouble);

  { set (replace) row of the constraint matrix  }
(* Const before type ignored *)
(* Const before type ignored *)
  procedure glp_set_mat_col(P:Pglp_prob; j:longint; len:longint; ind:Plongint; val:Pdouble);

  { set (replace) column of the constraint matrix  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
  procedure glp_load_matrix(P:Pglp_prob; ne:longint; ia:Plongint; ja:Plongint; ar:Pdouble);

  { load (replace) the whole constraint matrix  }
(* Const before type ignored *)
(* Const before type ignored *)
  function glp_check_dup(m:longint; n:longint; ne:longint; ia:Plongint; ja:Plongint):longint;

  { check for duplicate elements in sparse matrix  }
  procedure glp_sort_matrix(P:Pglp_prob);

  { sort elements of the constraint matrix  }
(* Const before type ignored *)
  procedure glp_del_rows(P:Pglp_prob; nrs:longint; num:Plongint);

  { delete specified rows from problem object  }
(* Const before type ignored *)
  procedure glp_del_cols(P:Pglp_prob; ncs:longint; num:Plongint);

  { delete specified columns from problem object  }
  procedure glp_copy_prob(dest:Pglp_prob; prob:Pglp_prob; names:longint);

  { copy problem object content  }
  procedure glp_erase_prob(P:Pglp_prob);

  { erase problem object content  }
  procedure glp_delete_prob(P:Pglp_prob);

  { delete problem object  }
(* Const before type ignored *)
  function glp_get_prob_name(P:Pglp_prob): Pchar;

  { retrieve problem name  }
(* Const before type ignored *)
  function glp_get_obj_name(P:Pglp_prob): Pchar;

  { retrieve objective function name  }
  function glp_get_obj_dir(P:Pglp_prob):longint;

  { retrieve optimization direction flag  }
  function glp_get_num_rows(P:Pglp_prob):longint;

  { retrieve number of rows  }
  function glp_get_num_cols(P:Pglp_prob):longint;

  { retrieve number of columns  }
(* Const before type ignored *)
  function glp_get_row_name(P:Pglp_prob; i:longint): Pchar;

  { retrieve row name  }
(* Const before type ignored *)
  function glp_get_col_name(P:Pglp_prob; j:longint): Pchar;

  { retrieve column name  }
  function glp_get_row_type(P:Pglp_prob; i:longint):longint;

  { retrieve row type  }
  function glp_get_row_lb(P:Pglp_prob; i:longint):double;

  { retrieve row lower bound  }
  function glp_get_row_ub(P:Pglp_prob; i:longint):double;

  { retrieve row upper bound  }
  function glp_get_col_type(P:Pglp_prob; j:longint):longint;

  { retrieve column type  }
  function glp_get_col_lb(P:Pglp_prob; j:longint):double;

  { retrieve column lower bound  }
  function glp_get_col_ub(P:Pglp_prob; j:longint):double;

  { retrieve column upper bound  }
  function glp_get_obj_coef(P:Pglp_prob; j:longint):double;

  { retrieve obj. coefficient or constant term  }
  function glp_get_num_nz(P:Pglp_prob):longint;

  { retrieve number of constraint coefficients  }
  function glp_get_mat_row(P:Pglp_prob; i:longint; ind:Plongint; val:Pdouble):longint;

  { retrieve row of the constraint matrix  }
  function glp_get_mat_col(P:Pglp_prob; j:longint; ind:Plongint; val:Pdouble):longint;

  { retrieve column of the constraint matrix  }
  procedure glp_create_index(P:Pglp_prob);

  { create the name index  }
(* Const before type ignored *)
  function glp_find_row(P:Pglp_prob; name:Pchar):longint;

  { find row by its name  }
(* Const before type ignored *)
  function glp_find_col(P:Pglp_prob; name:Pchar):longint;

  { find column by its name  }
  procedure glp_delete_index(P:Pglp_prob);

  { delete the name index  }
  procedure glp_set_rii(P:Pglp_prob; i:longint; rii:double);

  { set (change) row scale factor  }
  procedure glp_set_sjj(P:Pglp_prob; j:longint; sjj:double);

  { set (change) column scale factor  }
  function glp_get_rii(P:Pglp_prob; i:longint):double;

  { retrieve row scale factor  }
  function glp_get_sjj(P:Pglp_prob; j:longint):double;

  { retrieve column scale factor  }
  procedure glp_scale_prob(P:Pglp_prob; flags:longint);

  { scale problem data  }
  procedure glp_unscale_prob(P:Pglp_prob);

  { unscale problem data  }
  procedure glp_set_row_stat(P:Pglp_prob; i:longint; stat:longint);

  { set (change) row status  }
  procedure glp_set_col_stat(P:Pglp_prob; j:longint; stat:longint);

  { set (change) column status  }
  procedure glp_std_basis(P:Pglp_prob);

  { construct standard initial LP basis  }
  procedure glp_adv_basis(P:Pglp_prob; flags:longint);

  { construct advanced initial LP basis  }
  procedure glp_cpx_basis(P:Pglp_prob);

  { construct Bixby's initial LP basis  }
(* Const before type ignored *)
  function glp_simplex(P:Pglp_prob; parm:Pglp_smcp):longint;

  { solve LP problem with the simplex method  }
(* Const before type ignored *)
  function glp_exact(P:Pglp_prob; parm:Pglp_smcp):longint;

  { solve LP problem in exact arithmetic  }
  procedure glp_init_smcp(parm:Pglp_smcp);

  { initialize simplex method control parameters  }
  function glp_get_status(P:Pglp_prob):longint;

  { retrieve generic status of basic solution  }
  function glp_get_prim_stat(P:Pglp_prob):longint;

  { retrieve status of primal basic solution  }
  function glp_get_dual_stat(P:Pglp_prob):longint;

  { retrieve status of dual basic solution  }
  function glp_get_obj_val(P:Pglp_prob):double;

  { retrieve objective value (basic solution)  }
  function glp_get_row_stat(P:Pglp_prob; i:longint):longint;

  { retrieve row status  }
  function glp_get_row_prim(P:Pglp_prob; i:longint):double;

  { retrieve row primal value (basic solution)  }
  function glp_get_row_dual(P:Pglp_prob; i:longint):double;

  { retrieve row dual value (basic solution)  }
  function glp_get_col_stat(P:Pglp_prob; j:longint):longint;

  { retrieve column status  }
  function glp_get_col_prim(P:Pglp_prob; j:longint):double;

  { retrieve column primal value (basic solution)  }
  function   glp_get_col_dual(P:Pglp_prob; j:longint):double;

  { retrieve column dual value (basic solution)  }
  function glp_get_unbnd_ray(P:Pglp_prob):longint;

  { determine variable causing unboundedness  }
{ if 1 /* 08/VIII-2013; not documented yet */}

  function glp_get_it_cnt(P:Pglp_prob):longint;

  { get simplex solver iteration count  }
{ endif}
{ if 1 /* 08/VIII-2013; not documented yet */}

  procedure glp_set_it_cnt(P:Pglp_prob; it_cnt:longint);

  { set simplex solver iteration count  }
{ endif}
(* Const before type ignored *)

  function glp_interior(P:Pglp_prob; parm:Pglp_iptcp):longint;

  { solve LP problem with the interior-point method  }
  procedure glp_init_iptcp(parm:Pglp_iptcp);

  { initialize interior-point solver control parameters  }
  function glp_ipt_status(P:Pglp_prob):longint;

  { retrieve status of interior-point solution  }
  function glp_ipt_obj_val(P:Pglp_prob):double;

  { retrieve objective value (interior point)  }
  function glp_ipt_row_prim(P:Pglp_prob; i:longint):double;

  { retrieve row primal value (interior point)  }
  function glp_ipt_row_dual(P:Pglp_prob; i:longint):double;

  { retrieve row dual value (interior point)  }
  function glp_ipt_col_prim(P:Pglp_prob; j:longint):double;

  { retrieve column primal value (interior point)  }
  function glp_ipt_col_dual(P:Pglp_prob; j:longint):double;

  { retrieve column dual value (interior point)  }
  procedure glp_set_col_kind(P:Pglp_prob; j:longint; kind:longint);

  { set (change) column kind  }
  function glp_get_col_kind(P:Pglp_prob; j:longint):longint;

  { retrieve column kind  }
  function glp_get_num_int(P:Pglp_prob):longint;

  { retrieve number of integer columns  }
  function glp_get_num_bin(P:Pglp_prob):longint;

  { retrieve number of binary columns  }
(* Const before type ignored *)
  function glp_intopt(P:Pglp_prob; parm:Pglp_iocp):longint;

  { solve MIP problem with the branch-and-bound method  }
  procedure glp_init_iocp(parm:Pglp_iocp);

  { initialize integer optimizer control parameters  }
  function glp_mip_status(P:Pglp_prob):longint;

  { retrieve status of MIP solution  }
  function glp_mip_obj_val(P:Pglp_prob):double;

  { retrieve objective value (MIP solution)  }
  function glp_mip_row_val(P:Pglp_prob; i:longint):double;

  { retrieve row value (MIP solution)  }
  function glp_mip_col_val(P:Pglp_prob; j:longint):double;

  { retrieve column value (MIP solution)  }
  procedure glp_check_kkt(P:Pglp_prob; sol:longint; cond:longint; ae_max:Pdouble; ae_ind:Plongint; 
              re_max:Pdouble; re_ind:Plongint);

  { check feasibility/optimality conditions  }
(* Const before type ignored *)
  function glp_print_sol(P:Pglp_prob; fname:Pchar):longint;

  { write basic solution in printable format  }
(* Const before type ignored *)
  function glp_read_sol(P:Pglp_prob; fname:Pchar):longint;

  { read basic solution from text file  }
(* Const before type ignored *)
  function glp_write_sol(P:Pglp_prob; fname:Pchar):longint;

  { write basic solution to text file  }
(* Const before type ignored *)
(* Const before type ignored *)
  function glp_print_ranges(P:Pglp_prob; len:longint; list:Plongint; flags:longint; fname:Pchar):longint;

  { print sensitivity analysis report  }
(* Const before type ignored *)
  function glp_print_ipt(P:Pglp_prob; fname:Pchar):longint;

  { write interior-point solution in printable format  }
(* Const before type ignored *)
  function glp_read_ipt(P:Pglp_prob; fname:Pchar):longint;

  { read interior-point solution from text file  }
(* Const before type ignored *)
  function glp_write_ipt(P:Pglp_prob; fname:Pchar):longint;

  { write interior-point solution to text file  }
(* Const before type ignored *)
  function glp_print_mip(P:Pglp_prob; fname:Pchar):longint;

  { write MIP solution in printable format  }
(* Const before type ignored *)
  function glp_read_mip(P:Pglp_prob; fname:Pchar):longint;

  { read MIP solution from text file  }
(* Const before type ignored *)
  function glp_write_mip(P:Pglp_prob; fname:Pchar):longint;

  { write MIP solution to text file  }
  function glp_bf_exists(P:Pglp_prob):longint;

  { check if LP basis factorization exists  }
  function glp_factorize(P:Pglp_prob):longint;

  { compute LP basis factorization  }
  function glp_bf_updated(P:Pglp_prob):longint;

  { check if LP basis factorization has been updated  }
  procedure glp_get_bfcp(P:Pglp_prob; parm:Pglp_bfcp);

  { retrieve LP basis factorization control parameters  }
(* Const before type ignored *)
  procedure glp_set_bfcp(P:Pglp_prob; parm:Pglp_bfcp);

  { change LP basis factorization control parameters  }
  function glp_get_bhead(P:Pglp_prob; k:longint):longint;

  { retrieve LP basis header information  }
  function glp_get_row_bind(P:Pglp_prob; i:longint):longint;

  { retrieve row index in the basis header  }
  function glp_get_col_bind(P:Pglp_prob; j:longint):longint;

  { retrieve column index in the basis header  }
  procedure glp_ftran(P:Pglp_prob; x:Pdouble);

  { perform forward transformation (solve system B*x = b)  }
  procedure glp_btran(P:Pglp_prob; x:Pdouble);

  { perform backward transformation (solve system B'*x = b)  }
  function glp_warm_up(P:Pglp_prob):longint;

  { "warm up" LP basis  }
  function glp_eval_tab_row(P:Pglp_prob; k:longint; ind:Plongint; val:Pdouble):longint;

  { compute row of the simplex tableau  }
  function glp_eval_tab_col(P:Pglp_prob; k:longint; ind:Plongint; val:Pdouble):longint;

  { compute column of the simplex tableau  }
  function glp_transform_row(P:Pglp_prob; len:longint; ind:Plongint; val:Pdouble):longint;

  { transform explicitly specified row  }
  function glp_transform_col(P:Pglp_prob; len:longint; ind:Plongint; val:Pdouble):longint;

  { transform explicitly specified column  }
(* Const before type ignored *)
(* Const before type ignored *)
  function glp_prim_rtest(P:Pglp_prob; len:longint; ind:Plongint; val:Pdouble; dir:longint; 
             eps:double):longint;

  { perform primal ratio test  }
(* Const before type ignored *)
(* Const before type ignored *)
  function glp_dual_rtest(P:Pglp_prob; len:longint; ind:Plongint; val:Pdouble; dir:longint; 
             eps:double):longint;

  { perform dual ratio test  }
  procedure glp_analyze_bound(P:Pglp_prob; k:longint; value1:Pdouble; var1:Plongint; value2:Pdouble; 
              var2:Plongint);

  { analyze active bound of non-basic variable  }
  procedure glp_analyze_coef(P:Pglp_prob; k:longint; coef1:Pdouble; var1:Plongint; value1:Pdouble; 
              coef2:Pdouble; var2:Plongint; value2:Pdouble);

  { analyze objective coefficient at basic variable  }
{ if 1 /* 10/XII-2017 */}

  function glp_npp_alloc_wksp:Pglp_prep;

  { allocate the preprocessor workspace  }
  procedure glp_npp_load_prob(prep:Pglp_prep; P:Pglp_prob; sol:longint; names:longint);

  { load original problem instance  }
  function glp_npp_preprocess1(prep:Pglp_prep; hard:longint):longint;

  { perform basic LP/MIP preprocessing  }
  procedure glp_npp_build_prob(prep:Pglp_prep; Q:Pglp_prob);

  { build resultant problem instance  }
  procedure glp_npp_postprocess(prep:Pglp_prep; Q:Pglp_prob);

  { postprocess solution to resultant problem  }
  procedure glp_npp_obtain_sol(prep:Pglp_prep; P:Pglp_prob);

  { obtain solution to original problem  }
  procedure glp_npp_free_wksp(prep:Pglp_prep);

  { free the preprocessor workspace  }
{$endif}

  function glp_ios_reason(T:Pglp_tree):longint;

  { determine reason for calling the callback routine  }
  function glp_ios_get_prob(T:Pglp_tree):Pglp_prob;

  { access the problem object  }
  procedure glp_ios_tree_size(T:Pglp_tree; a_cnt:Plongint; n_cnt:Plongint; t_cnt:Plongint);

  { determine size of the branch-and-bound tree  }
  function glp_ios_curr_node(T:Pglp_tree):longint;

  { determine current active subproblem  }
  function glp_ios_next_node(T:Pglp_tree; p:longint):longint;

  { determine next active subproblem  }
  function glp_ios_prev_node(T:Pglp_tree; p:longint):longint;

  { determine previous active subproblem  }
  function glp_ios_up_node(T:Pglp_tree; p:longint):longint;

  { determine parent subproblem  }
  function glp_ios_node_level(T:Pglp_tree; p:longint):longint;

  { determine subproblem level  }
  function glp_ios_node_bound(T:Pglp_tree; p:longint):double;

  { determine subproblem local bound  }
  function glp_ios_best_node(T:Pglp_tree):longint;

  { find active subproblem with best local bound  }
  function glp_ios_mip_gap(T:Pglp_tree):double;

  { compute relative MIP gap  }
  function glp_ios_node_data(T:Pglp_tree; p:longint):pointer;

  { access subproblem application-specific data  }
  procedure glp_ios_row_attr(T:Pglp_tree; i:longint; attr:Pglp_attr);

  { retrieve additional row attributes  }
  function glp_ios_pool_size(T:Pglp_tree):longint;

  { determine current size of the cut pool  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
  function glp_ios_add_row(T:Pglp_tree; name:Pchar; klass:longint; flags:longint; len:longint; 
             ind:Plongint; val:Pdouble; _type:longint; rhs:double):longint;

  { add row (constraint) to the cut pool  }
  procedure glp_ios_del_row(T:Pglp_tree; i:longint);

  { remove row (constraint) from the cut pool  }
  procedure glp_ios_clear_pool(T:Pglp_tree);

  { remove all rows (constraints) from the cut pool  }
  function glp_ios_can_branch(T:Pglp_tree; j:longint):longint;

  { check if can branch upon specified variable  }
  procedure glp_ios_branch_upon(T:Pglp_tree; j:longint; sel:longint);

  { choose variable to branch upon  }
  procedure glp_ios_select_node(T:Pglp_tree; p:longint);

  { select subproblem to continue the search  }
(* Const before type ignored *)
  function glp_ios_heur_sol(T:Pglp_tree; x:Pdouble):longint;

  { provide solution found by heuristic  }
  procedure glp_ios_terminate(T:Pglp_tree);

  { terminate the solution process  }
{$ifdef GLP_UNDOC}
  function glp_gmi_cut(P:Pglp_prob; j:longint; ind:Plongint; val:Pdouble; phi:Pdouble):longint;

  { generate Gomory's mixed integer cut (core routine)  }
  function glp_gmi_gen(P:Pglp_prob; pool:Pglp_prob; max_cuts:longint):longint;

  { generate Gomory's mixed integer cuts  }

  type
  { cover cur generator workspace  }

  function glp_cov_init(P:Pglp_prob):^glp_cov;

  { create and initialize cover cut generator  }
  procedure glp_cov_gen1(P:Pglp_prob; cov:Pglp_cov; pool:Pglp_prob);

  { generate locally valid simple cover cuts  }
  procedure glp_cov_free(cov:Pglp_cov);

  { delete cover cut generator workspace  }


  function glp_mir_init(P:Pglp_prob):^glp_mir;

  { create and initialize MIR cut generator  }
  function glp_mir_gen(P:Pglp_prob; mir:Pglp_mir; pool:Pglp_prob):longint;

  { generate mixed integer rounding (MIR) cuts  }
  procedure glp_mir_free(mir:Pglp_mir);

  { delete MIR cut generator workspace  }

  function glp_cfg_init(P:Pglp_prob):^glp_cfg;

  { create and initialize conflict graph  }
  procedure glp_cfg_free(G:Pglp_cfg);

  { delete conflict graph descriptor  }
  function glp_clq_cut(P:Pglp_prob; G:Pglp_cfg; ind:Plongint; val:Pdouble):longint;

  { generate clique cut from conflict graph  }
{$endif}
  { GLP_UNDOC  }

  procedure glp_init_mpscp(parm:Pglp_mpscp);

  { initialize MPS format control parameters  }
(* Const before type ignored *)
(* Const before type ignored *)
  function glp_read_mps(P:Pglp_prob; fmt:longint; parm:Pglp_mpscp; fname:Pchar):longint;

  { read problem data in MPS format  }
(* Const before type ignored *)
(* Const before type ignored *)
  function glp_write_mps(P:Pglp_prob; fmt:longint; parm:Pglp_mpscp; fname:Pchar):longint;

  { write problem data in MPS format  }
  procedure glp_init_cpxcp(parm:Pglp_cpxcp);

  { initialize CPLEX LP format control parameters  }
(* Const before type ignored *)
(* Const before type ignored *)
  function glp_read_lp(P:Pglp_prob; parm:Pglp_cpxcp; fname:Pchar):longint;

  { read problem data in CPLEX LP format  }
(* Const before type ignored *)
(* Const before type ignored *)
  function glp_write_lp(P:Pglp_prob; parm:Pglp_cpxcp; fname:Pchar):longint;

  { write problem data in CPLEX LP format  }
(* Const before type ignored *)
  function glp_read_prob(P:Pglp_prob; flags:longint; fname:Pchar):longint;

  { read problem data in GLPK format  }
(* Const before type ignored *)
  function glp_write_prob(P:Pglp_prob; flags:longint; fname:Pchar):longint;

  { write problem data in GLPK format  }
  function glp_mpl_alloc_wksp:Pglp_tran;

  { allocate the MathProg translator workspace  }
  procedure glp_mpl_init_rand(tran:Pglp_tran; seed:longint);

  { initialize pseudo-random number generator  }
(* Const before type ignored *)
  function glp_mpl_read_model(tran:Pglp_tran; fname:Pchar; skip:longint):longint;

  { read and translate model section  }
(* Const before type ignored *)
  function glp_mpl_read_data(tran:Pglp_tran; fname:Pchar):longint;

  { read and translate data section  }
(* Const before type ignored *)
  function glp_mpl_generate(tran:Pglp_tran; fname:Pchar):longint;

  { generate the model  }
  procedure glp_mpl_build_prob(tran:Pglp_tran; prob:Pglp_prob);

  { build LP/MIP problem instance from the model  }
  function glp_mpl_postsolve(tran:Pglp_tran; prob:Pglp_prob; sol:longint):longint;

  { postsolve the model  }
  procedure glp_mpl_free_wksp(tran:Pglp_tran);

  { free the MathProg translator workspace  }
(* Const before type ignored *)
  function glp_read_cnfsat(P:Pglp_prob; fname:Pchar):longint;

  { read CNF-SAT problem data in DIMACS format  }
  function glp_check_cnfsat(P:Pglp_prob):longint;

  { check for CNF-SAT problem instance  }
(* Const before type ignored *)
  function glp_write_cnfsat(P:Pglp_prob; fname:Pchar):longint;

  { write CNF-SAT problem data in DIMACS format  }
  function glp_minisat1(P:Pglp_prob):longint;

  { solve CNF-SAT problem with MiniSat solver  }
  function glp_intfeas1(P:Pglp_prob; use_bound:longint; obj_bound:longint):longint;

  { solve integer feasibility problem  }
  function glp_init_env:longint;

  { initialize GLPK environment  }
(* Const before type ignored *)
  function glp_version:Pchar;

  { determine library version  }
(* Const before type ignored *)
(* Const before type ignored *)
  function glp_config(option:Pchar):Pchar;

  { determine library configuration  }
  function glp_free_env:longint;

  { free GLPK environment  }
(* Const before type ignored *)
  procedure glp_puts(s:Pchar);

  (*???rch
  { write string on terminal  }
(* Const before type ignored *)
  procedure glp_printf(fmt:Pchar; args:array of const);

*)
  { write formatted output on terminal  }
(* Const before type ignored *)
(*???rch
  procedure glp_vprintf(fmt:Pchar; arg:va_list);
*)
  { write formatted output on terminal  }
  function glp_term_out(flag:longint):longint;

  { enable/disable terminal output  }
(* Const before type ignored *)
  procedure glp_term_hook(func: TTermHook; info:pointer);

  { install hook to intercept terminal output  }
(* Const before type ignored *)
  function glp_open_tee(name:Pchar):longint;

  { start copying terminal output to text file  }
  function glp_close_tee:longint;

  { stop copying terminal output to text file  }
{$ifndef GLP_ERRFUNC_DEFINED}
{$define GLP_ERRFUNC_DEFINED}  
(* Const before type ignored *)

  type

    glp_errfunc = procedure (fmt:Pchar; args:array of const);cdecl;
{$endif}

(*??? rch
  { was #define dname def_expr }
  function glp_error : longint; { return type might be wrong }
*)

(* Const before type ignored *)
  function glp_error_( file_:Pchar; line:longint):glp_errfunc;

  { display fatal error message and terminate execution  }
{ if 1 /* 07/XI-2015 */}

  function glp_at_error:longint;

  { check for error state  }
{ endif}
  { ojo comento esto porque no sé como traducirlo }
  {define glp_assert(expr)  ((void)((expr) || (glp_assert_( #expr, __FILE__, __LINE__), 1))) }
(* Const before type ignored *)
(* Const before type ignored *)

  procedure glp_assert_(expr:Pchar; file_:Pchar; line:longint);

  { check for logical condition  }
  procedure glp_error_hook( func: TErrorHook; info:pointer);

  (*???rch
  { install hook to intercept abnormal termination  }
  { was #define dname(params) para_def_expr }
  { argument types are unknown }
  { return type might be wrong }   
  function glp_malloc(size : longint) : longint;  
*)

(*???rch
  { allocate memory block (obsolete)  }
  { was #define dname(params) para_def_expr }
  { argument types are unknown }
  { return type might be wrong }   
  function glp_calloc(n,size : longint) : longint;  
*)

  { allocate memory block (obsolete)  }
  function glp_alloc(n:longint; size:longint):pointer;

  { allocate memory block  }
  function glp_realloc(ptr:pointer; n:longint; size:longint):pointer;

  { reallocate memory block  }
  procedure glp_free(ptr:pointer);

  { free (deallocate) memory block  }
  procedure glp_mem_limit(limit:longint);

  { set memory usage limit  }
  procedure glp_mem_usage(count:Plongint; cpeak:Plongint; total:Psize_t; tpeak:Psize_t);

  { get memory usage information  }
  function glp_time:double;

  { determine current universal time  }
  function glp_difftime(t1:double; t0:double):double;

  { compute difference between two time values  }
  function glp_create_graph(v_size:longint; a_size:longint):Pglp_graph;

  { create graph  }
(* Const before type ignored *)
  procedure glp_set_graph_name(G:Pglp_graph; name:Pchar);

  { assign (change) graph name  }
  function glp_add_vertices(G:Pglp_graph; nadd:longint):longint;

  { add new vertices to graph  }
(* Const before type ignored *)
  procedure glp_set_vertex_name(G:Pglp_graph; i:longint; name:Pchar);

  { assign (change) vertex name  }
  function glp_add_arc(G:Pglp_graph; i:longint; j:longint):Pglp_arc;

  { add new arc to graph  }
(* Const before type ignored *)
  procedure glp_del_vertices(G:Pglp_graph; ndel:longint; num:Plongint);

  { delete vertices from graph  }
  procedure glp_del_arc(G:Pglp_graph; a:Pglp_arc);

  { delete arc from graph  }
  procedure glp_erase_graph(G:Pglp_graph; v_size:longint; a_size:longint);

  { erase graph content  }
  procedure glp_delete_graph(G:Pglp_graph);

  { delete graph  }
  procedure glp_create_v_index(G:Pglp_graph);

  { create vertex name index  }
(* Const before type ignored *)
  function glp_find_vertex(G:Pglp_graph; name:Pchar):longint;

  { find vertex by its name  }
  procedure glp_delete_v_index(G:Pglp_graph);

  { delete vertex name index  }
(* Const before type ignored *)
  function glp_read_graph(G:Pglp_graph; fname:Pchar):longint;

  { read graph from plain text file  }
(* Const before type ignored *)
  function glp_write_graph(G:Pglp_graph; fname:Pchar):longint;

  { write graph to plain text file  }
  procedure glp_mincost_lp(P:Pglp_prob; G:Pglp_graph; names:longint; v_rhs:longint; a_low:longint; 
              a_cap:longint; a_cost:longint);

  { convert minimum cost flow problem to LP  }
  function glp_mincost_okalg(G:Pglp_graph; v_rhs:longint; a_low:longint; a_cap:longint; a_cost:longint; 
             sol:Pdouble; a_x:longint; v_pi:longint):longint;

  { find minimum-cost flow with out-of-kilter algorithm  }
  function glp_mincost_relax4(G:Pglp_graph; v_rhs:longint; a_low:longint; a_cap:longint; a_cost:longint; 
             crash:longint; sol:Pdouble; a_x:longint; a_rc:longint):longint;

  { find minimum-cost flow with Bertsekas-Tseng relaxation method  }
  procedure glp_maxflow_lp(P:Pglp_prob; G:Pglp_graph; names:longint; s:longint; t:longint; 
              a_cap:longint);

  { convert maximum flow problem to LP  }
  function glp_maxflow_ffalg(G:Pglp_graph; s:longint; t:longint; a_cap:longint; sol:Pdouble; 
             a_x:longint; v_cut:longint):longint;

  { find maximal flow with Ford-Fulkerson algorithm  }
  function glp_check_asnprob(G:Pglp_graph; v_set:longint):longint;

  { check correctness of assignment problem data  }
  { assignment problem formulation:  }
  { perfect matching (minimization)  }
  const
    GLP_ASN_MIN = 1;    
  { perfect matching (maximization)  }
    GLP_ASN_MAX = 2;    
  { maximum matching  }
    GLP_ASN_MMP = 3;    

  function glp_asnprob_lp(P:Pglp_prob; form:longint; G:Pglp_graph; names:longint; v_set:longint; 
             a_cost:longint):longint;

  { convert assignment problem to LP  }
  function glp_asnprob_okalg(form:longint; G:Pglp_graph; v_set:longint; a_cost:longint; sol:Pdouble; 
             a_x:longint):longint;

  { solve assignment problem with out-of-kilter algorithm  }
  function glp_asnprob_hall(G:Pglp_graph; v_set:longint; a_x:longint):longint;

  { find bipartite matching of maximum cardinality  }
  function glp_cpp(G:Pglp_graph; v_t:longint; v_es:longint; v_ls:longint):double;

  { solve critical path problem  }
(* Const before type ignored *)
  function glp_read_mincost(G:Pglp_graph; v_rhs:longint; a_low:longint; a_cap:longint; a_cost:longint; 
             fname:Pchar):longint;

  { read min-cost flow problem data in DIMACS format  }
(* Const before type ignored *)
  function glp_write_mincost(G:Pglp_graph; v_rhs:longint; a_low:longint; a_cap:longint; a_cost:longint; 
             fname:Pchar):longint;

  { write min-cost flow problem data in DIMACS format  }
(* Const before type ignored *)
  function glp_read_maxflow(G:Pglp_graph; s:Plongint; t:Plongint; a_cap:longint; fname:Pchar):longint;

  { read maximum flow problem data in DIMACS format  }
(* Const before type ignored *)
  function glp_write_maxflow(G:Pglp_graph; s:longint; t:longint; a_cap:longint; fname:Pchar):longint;

  { write maximum flow problem data in DIMACS format  }
(* Const before type ignored *)
  function glp_read_asnprob(G:Pglp_graph; v_set:longint; a_cost:longint; fname:Pchar):longint;

  { read assignment problem data in DIMACS format  }
(* Const before type ignored *)
  function glp_write_asnprob(G:Pglp_graph; v_set:longint; a_cost:longint; fname:Pchar):longint;

  { write assignment problem data in DIMACS format  }
(* Const before type ignored *)
  function glp_read_ccdata(G:Pglp_graph; v_wgt:longint; fname:Pchar):longint;

  { read graph in DIMACS clique/coloring format  }
(* Const before type ignored *)
  function glp_write_ccdata(G:Pglp_graph; v_wgt:longint; fname:Pchar):longint;

  { write graph in DIMACS clique/coloring format  }
(* Const before type ignored *)
  function glp_netgen(G:Pglp_graph; v_rhs:longint; a_cap:longint; a_cost:longint; parm: TArr16LongInt ):longint;

  { Klingman's network problem generator  }
  procedure glp_netgen_prob(nprob:longint; parm:TArr16LongInt);

  { Klingman's standard network problem instance  }
(* Const before type ignored *)
  function glp_gridgen(G:Pglp_graph; v_rhs:longint; a_cap:longint; a_cost:longint; parm: TArr14LongInt):longint;

  { grid-like network problem generator  }
(* Const before type ignored *)
  function glp_rmfgen(G:Pglp_graph; s:Plongint; t:Plongint; a_cap:longint; parm: TArr5LongInt ):longint;

  { Goldfarb's maximum flow problem generator  }
  function glp_weak_comp(G:Pglp_graph; v_num:longint):longint;

  { find all weakly connected components of graph  }
  function glp_strong_comp(G:Pglp_graph; v_num:longint):longint;

  { find all strongly connected components of graph  }
  function glp_top_sort(G:Pglp_graph; v_num:longint):longint;

  { topological sorting of acyclic digraph  }
  function glp_wclique_exact(G:Pglp_graph; v_wgt:longint; sol:Pdouble; v_set:longint):longint;

  { find maximum weight clique with exact algorithm  }
{ C++ end of extern C conditionnal removed }
{endif}
  { eof  }

implementation

  function glp_create_prob:Pglp_prob;  external GLPKLIB;
  procedure glp_set_prob_name(P:Pglp_prob; name:Pchar); external GLPKLIB;
  procedure glp_set_obj_name(P:Pglp_prob; name:Pchar); external GLPKLIB;
  procedure glp_set_obj_dir(P:Pglp_prob; dir:longint); external GLPKLIB;
  function glp_add_rows(P:Pglp_prob; nrs:longint):longint; external GLPKLIB;
  function glp_add_cols(P:Pglp_prob; ncs:longint):longint; external GLPKLIB;
  procedure glp_set_row_name(P:Pglp_prob; i:longint; name:Pchar); external GLPKLIB;
  procedure glp_set_col_name(P:Pglp_prob; j:longint; name:Pchar); external GLPKLIB;
  procedure glp_set_row_bnds(P:Pglp_prob; i:longint; _type:longint; lb:double; ub:double); external GLPKLIB;
  procedure glp_set_col_bnds(P:Pglp_prob; j:longint; _type:longint; lb:double; ub:double); external GLPKLIB;
  procedure glp_set_obj_coef(P:Pglp_prob; j:longint; coef:double); external GLPKLIB;
  procedure glp_set_mat_row(P:Pglp_prob; i:longint; len:longint; ind:Plongint; val:Pdouble); external GLPKLIB;
  procedure glp_set_mat_col(P:Pglp_prob; j:longint; len:longint; ind:Plongint; val:Pdouble); external GLPKLIB;
  procedure glp_load_matrix(P:Pglp_prob; ne:longint; ia:Plongint; ja:Plongint; ar:Pdouble); external GLPKLIB;
  function glp_check_dup(m:longint; n:longint; ne:longint; ia:Plongint; ja:Plongint):longint; external GLPKLIB;
  procedure glp_sort_matrix(P:Pglp_prob); external GLPKLIB;
  procedure glp_del_rows(P:Pglp_prob; nrs:longint; num:Plongint); external GLPKLIB;
  procedure glp_del_cols(P:Pglp_prob; ncs:longint; num:Plongint); external GLPKLIB;
  procedure glp_copy_prob(dest:Pglp_prob; prob:Pglp_prob; names:longint); external GLPKLIB;
  procedure glp_erase_prob(P:Pglp_prob); external GLPKLIB;
  procedure glp_delete_prob(P:Pglp_prob); external GLPKLIB;
  function glp_get_prob_name(P:Pglp_prob):Pchar; external GLPKLIB;
  function glp_get_obj_name(P:Pglp_prob):Pchar; external GLPKLIB;
  function glp_get_obj_dir(P:Pglp_prob):longint; external GLPKLIB;
  function glp_get_num_rows(P:Pglp_prob):longint; external GLPKLIB;
  function glp_get_num_cols(P:Pglp_prob):longint; external GLPKLIB;
  function glp_get_row_name(P:Pglp_prob; i:longint):Pchar; external GLPKLIB;
  function glp_get_col_name(P:Pglp_prob; j:longint):Pchar; external GLPKLIB;
  function glp_get_row_type(P:Pglp_prob; i:longint):longint; external GLPKLIB;
  function glp_get_row_lb(P:Pglp_prob; i:longint):double; external GLPKLIB;
  function glp_get_row_ub(P:Pglp_prob; i:longint):double; external GLPKLIB;
  function glp_get_col_type(P:Pglp_prob; j:longint):longint; external GLPKLIB;
  function glp_get_col_lb(P:Pglp_prob; j:longint):double; external GLPKLIB;
  function glp_get_col_ub(P:Pglp_prob; j:longint):double; external GLPKLIB;
  function glp_get_obj_coef(P:Pglp_prob; j:longint):double; external GLPKLIB;
  function glp_get_num_nz(P:Pglp_prob):longint; external GLPKLIB;
  function glp_get_mat_row(P:Pglp_prob; i:longint; ind:Plongint; val:Pdouble):longint; external GLPKLIB;
  function glp_get_mat_col(P:Pglp_prob; j:longint; ind:Plongint; val:Pdouble):longint; external GLPKLIB;
  procedure glp_create_index(P:Pglp_prob); external GLPKLIB;
  function glp_find_row(P:Pglp_prob; name:Pchar):longint; external GLPKLIB;
  function glp_find_col(P:Pglp_prob; name:Pchar):longint; external GLPKLIB;
  procedure glp_delete_index(P:Pglp_prob); external GLPKLIB;
  procedure glp_set_rii(P:Pglp_prob; i:longint; rii:double); external GLPKLIB;
  procedure glp_set_sjj(P:Pglp_prob; j:longint; sjj:double); external GLPKLIB;
  function glp_get_rii(P:Pglp_prob; i:longint):double; external GLPKLIB;
  function glp_get_sjj(P:Pglp_prob; j:longint):double; external GLPKLIB;
  procedure glp_scale_prob(P:Pglp_prob; flags:longint); external GLPKLIB;
  procedure glp_unscale_prob(P:Pglp_prob); external GLPKLIB;
  procedure glp_set_row_stat(P:Pglp_prob; i:longint; stat:longint); external GLPKLIB;
  procedure glp_set_col_stat(P:Pglp_prob; j:longint; stat:longint); external GLPKLIB;
  procedure glp_std_basis(P:Pglp_prob); external GLPKLIB;
  procedure glp_adv_basis(P:Pglp_prob; flags:longint); external GLPKLIB;
  procedure glp_cpx_basis(P:Pglp_prob); external GLPKLIB;
  function glp_simplex(P:Pglp_prob; parm:Pglp_smcp):longint; external GLPKLIB;
  function glp_exact(P:Pglp_prob; parm:Pglp_smcp):longint; external GLPKLIB;
  procedure glp_init_smcp(parm:Pglp_smcp); external GLPKLIB;
  function glp_get_status(P:Pglp_prob):longint; external GLPKLIB;
  function glp_get_prim_stat(P:Pglp_prob):longint; external GLPKLIB;
  function glp_get_dual_stat(P:Pglp_prob):longint; external GLPKLIB;
  function glp_get_obj_val(P:Pglp_prob):double; external GLPKLIB;
  function glp_get_row_stat(P:Pglp_prob; i:longint):longint; external GLPKLIB;
  function glp_get_row_prim(P:Pglp_prob; i:longint):double; external GLPKLIB;
  function glp_get_row_dual(P:Pglp_prob; i:longint):double; external GLPKLIB;
  function glp_get_col_stat(P:Pglp_prob; j:longint):longint; external GLPKLIB;
  function glp_get_col_prim(P:Pglp_prob; j:longint):double; external GLPKLIB;
  function glp_get_col_dual(P:Pglp_prob; j:longint):double; external GLPKLIB;
  function glp_get_unbnd_ray(P:Pglp_prob):longint; external GLPKLIB;
  function glp_get_it_cnt(P:Pglp_prob):longint; external GLPKLIB;
  procedure glp_set_it_cnt(P:Pglp_prob; it_cnt:longint); external GLPKLIB;
  function glp_interior(P:Pglp_prob; parm:Pglp_iptcp):longint; external GLPKLIB;
  procedure glp_init_iptcp(parm:Pglp_iptcp); external GLPKLIB;
  function glp_ipt_status(P:Pglp_prob):longint; external GLPKLIB;
  function glp_ipt_obj_val(P:Pglp_prob):double; external GLPKLIB;
  function glp_ipt_row_prim(P:Pglp_prob; i:longint):double; external GLPKLIB;
  function glp_ipt_row_dual(P:Pglp_prob; i:longint):double; external GLPKLIB;
  function glp_ipt_col_prim(P:Pglp_prob; j:longint):double; external GLPKLIB;
  function glp_ipt_col_dual(P:Pglp_prob; j:longint):double; external GLPKLIB;
  procedure glp_set_col_kind(P:Pglp_prob; j:longint; kind:longint); external GLPKLIB;
  function glp_get_col_kind(P:Pglp_prob; j:longint):longint; external GLPKLIB;
  function glp_get_num_int(P:Pglp_prob):longint; external GLPKLIB;
  function glp_get_num_bin(P:Pglp_prob):longint; external GLPKLIB;
  function glp_intopt(P:Pglp_prob; parm:Pglp_iocp):longint; external GLPKLIB;
  procedure glp_init_iocp(parm:Pglp_iocp); external GLPKLIB;
  function glp_mip_status(P:Pglp_prob):longint; external GLPKLIB;
  function glp_mip_obj_val(P:Pglp_prob):double; external GLPKLIB;
  function glp_mip_row_val(P:Pglp_prob; i:longint):double; external GLPKLIB;
  function glp_mip_col_val(P:Pglp_prob; j:longint):double; external GLPKLIB;
  procedure glp_check_kkt(P:Pglp_prob; sol:longint; cond:longint; ae_max:Pdouble; ae_ind:Plongint;
              re_max:Pdouble; re_ind:Plongint); external GLPKLIB;
  function glp_print_sol(P:Pglp_prob; fname:Pchar):longint; external GLPKLIB;
  function glp_read_sol(P:Pglp_prob; fname:Pchar):longint; external GLPKLIB;
  function glp_write_sol(P:Pglp_prob; fname:Pchar):longint; external GLPKLIB;
  function glp_print_ranges(P:Pglp_prob; len:longint; list:Plongint; flags:longint; fname:Pchar):longint; external GLPKLIB;
  function glp_print_ipt(P:Pglp_prob; fname:Pchar):longint; external GLPKLIB;
  function glp_read_ipt(P:Pglp_prob; fname:Pchar):longint; external GLPKLIB;
  function glp_write_ipt(P:Pglp_prob; fname:Pchar):longint; external GLPKLIB;
  function glp_print_mip(P:Pglp_prob; fname:Pchar):longint; external GLPKLIB;
  function glp_read_mip(P:Pglp_prob; fname:Pchar):longint; external GLPKLIB;
  function glp_write_mip(P:Pglp_prob; fname:Pchar):longint; external GLPKLIB;
  function glp_bf_exists(P:Pglp_prob):longint; external GLPKLIB;
  function glp_factorize(P:Pglp_prob):longint; external GLPKLIB;
  function glp_bf_updated(P:Pglp_prob):longint; external GLPKLIB;
  procedure glp_get_bfcp(P:Pglp_prob; parm:Pglp_bfcp); external GLPKLIB;
  procedure glp_set_bfcp(P:Pglp_prob; parm:Pglp_bfcp); external GLPKLIB;
  function glp_get_bhead(P:Pglp_prob; k:longint):longint; external GLPKLIB;
  function glp_get_row_bind(P:Pglp_prob; i:longint):longint; external GLPKLIB;
  function glp_get_col_bind(P:Pglp_prob; j:longint):longint; external GLPKLIB;
  procedure glp_ftran(P:Pglp_prob; x:Pdouble); external GLPKLIB;
  procedure glp_btran(P:Pglp_prob; x:Pdouble); external GLPKLIB;
  function glp_warm_up(P:Pglp_prob):longint; external GLPKLIB;
  function glp_eval_tab_row(P:Pglp_prob; k:longint; ind:Plongint; val:Pdouble):longint; external GLPKLIB;
  function glp_eval_tab_col(P:Pglp_prob; k:longint; ind:Plongint; val:Pdouble):longint; external GLPKLIB;
  function glp_transform_row(P:Pglp_prob; len:longint; ind:Plongint; val:Pdouble):longint; external GLPKLIB;
  function glp_transform_col(P:Pglp_prob; len:longint; ind:Plongint; val:Pdouble):longint; external GLPKLIB;
  function glp_prim_rtest(P:Pglp_prob; len:longint; ind:Plongint; val:Pdouble; dir:longint;
             eps:double):longint; external GLPKLIB;
  function glp_dual_rtest(P:Pglp_prob; len:longint; ind:Plongint; val:Pdouble; dir:longint;
             eps:double):longint; external GLPKLIB;
  procedure glp_analyze_bound(P:Pglp_prob; k:longint; value1:Pdouble; var1:Plongint; value2:Pdouble;
              var2:Plongint); external GLPKLIB;
  procedure glp_analyze_coef(P:Pglp_prob; k:longint; coef1:Pdouble; var1:Plongint; value1:Pdouble;
              coef2:Pdouble; var2:Plongint; value2:Pdouble); external GLPKLIB;
  function glp_npp_alloc_wksp:Pglp_prep; external GLPKLIB;
  procedure glp_npp_load_prob(prep:Pglp_prep; P:Pglp_prob; sol:longint; names:longint); external GLPKLIB;
  function glp_npp_preprocess1(prep:Pglp_prep; hard:longint):longint; external GLPKLIB;
  procedure glp_npp_build_prob(prep:Pglp_prep; Q:Pglp_prob); external GLPKLIB;
  procedure glp_npp_postprocess(prep:Pglp_prep; Q:Pglp_prob); external GLPKLIB;
  procedure glp_npp_obtain_sol(prep:Pglp_prep; P:Pglp_prob); external GLPKLIB;
  procedure glp_npp_free_wksp(prep:Pglp_prep); external GLPKLIB;
  function glp_ios_reason(T:Pglp_tree):longint; external GLPKLIB;
  function glp_ios_get_prob(T:Pglp_tree):Pglp_prob; external GLPKLIB;
  procedure glp_ios_tree_size(T:Pglp_tree; a_cnt:Plongint; n_cnt:Plongint; t_cnt:Plongint); external GLPKLIB;
  function glp_ios_curr_node(T:Pglp_tree):longint; external GLPKLIB;
  function glp_ios_next_node(T:Pglp_tree; p:longint):longint; external GLPKLIB;
  function glp_ios_prev_node(T:Pglp_tree; p:longint):longint; external GLPKLIB;
  function glp_ios_up_node(T:Pglp_tree; p:longint):longint; external GLPKLIB;
  function glp_ios_node_level(T:Pglp_tree; p:longint):longint; external GLPKLIB;
  function glp_ios_node_bound(T:Pglp_tree; p:longint):double; external GLPKLIB;
  function glp_ios_best_node(T:Pglp_tree):longint; external GLPKLIB;
  function glp_ios_mip_gap(T:Pglp_tree):double; external GLPKLIB;
  function glp_ios_node_data(T:Pglp_tree; p:longint):pointer; external GLPKLIB;
  procedure glp_ios_row_attr(T:Pglp_tree; i:longint; attr:Pglp_attr); external GLPKLIB;
  function glp_ios_pool_size(T:Pglp_tree):longint; external GLPKLIB;
  function glp_ios_add_row(T:Pglp_tree; name:Pchar; klass:longint; flags:longint; len:longint;
             ind:Plongint; val:Pdouble; _type:longint; rhs:double):longint; external GLPKLIB;
  procedure glp_ios_del_row(T:Pglp_tree; i:longint); external GLPKLIB;
  procedure glp_ios_clear_pool(T:Pglp_tree); external GLPKLIB;
  function glp_ios_can_branch(T:Pglp_tree; j:longint):longint; external GLPKLIB;
  procedure glp_ios_branch_upon(T:Pglp_tree; j:longint; sel:longint); external GLPKLIB;
  procedure glp_ios_select_node(T:Pglp_tree; p:longint); external GLPKLIB;
  function glp_ios_heur_sol(T:Pglp_tree; x:Pdouble):longint; external GLPKLIB;
  procedure glp_ios_terminate(T:Pglp_tree); external GLPKLIB;
  function glp_gmi_cut(P:Pglp_prob; j:longint; ind:Plongint; val:Pdouble; phi:Pdouble):longint; external GLPKLIB;
  function glp_gmi_gen(P:Pglp_prob; pool:Pglp_prob; max_cuts:longint):longint; external GLPKLIB;
  function glp_cov_init(P:Pglp_prob):Pglp_cov; external GLPKLIB;
  procedure glp_cov_gen1(P:Pglp_prob; cov:Pglp_cov; pool:Pglp_prob); external GLPKLIB;
  procedure glp_cov_free(cov:Pglp_cov); external GLPKLIB;
  function glp_mir_init(P:Pglp_prob):Pglp_mir; external GLPKLIB;
  function glp_mir_gen(P:Pglp_prob; mir:Pglp_mir; pool:Pglp_prob):longint; external GLPKLIB;
  procedure glp_mir_free(mir:Pglp_mir); external GLPKLIB;
  function glp_cfg_init(P:Pglp_prob):Pglp_cfg; external GLPKLIB;
  procedure glp_cfg_free(G:Pglp_cfg); external GLPKLIB;
  function glp_clq_cut(P:Pglp_prob; G:Pglp_cfg; ind:Plongint; val:Pdouble):longint; external GLPKLIB;
  procedure glp_init_mpscp(parm:Pglp_mpscp); external GLPKLIB;
  function glp_read_mps(P:Pglp_prob; fmt:longint; parm:Pglp_mpscp; fname:Pchar):longint; external GLPKLIB;
  function glp_write_mps(P:Pglp_prob; fmt:longint; parm:Pglp_mpscp; fname:Pchar):longint; external GLPKLIB;
  procedure glp_init_cpxcp(parm:Pglp_cpxcp); external GLPKLIB;
  function glp_read_lp(P:Pglp_prob; parm:Pglp_cpxcp; fname:Pchar):longint; external GLPKLIB;
  function glp_write_lp(P:Pglp_prob; parm:Pglp_cpxcp; fname:Pchar):longint; external GLPKLIB;
  function glp_read_prob(P:Pglp_prob; flags:longint; fname:Pchar):longint; external GLPKLIB;
  function glp_write_prob(P:Pglp_prob; flags:longint; fname:Pchar):longint; external GLPKLIB;
  function glp_mpl_alloc_wksp:Pglp_tran; external GLPKLIB;
  procedure glp_mpl_init_rand(tran:Pglp_tran; seed:longint); external GLPKLIB;
  function glp_mpl_read_model(tran:Pglp_tran; fname:Pchar; skip:longint):longint; external GLPKLIB;
  function glp_mpl_read_data(tran:Pglp_tran; fname:Pchar):longint; external GLPKLIB;
  function glp_mpl_generate(tran:Pglp_tran; fname:Pchar):longint; external GLPKLIB;
  procedure glp_mpl_build_prob(tran:Pglp_tran; prob:Pglp_prob); external GLPKLIB;
  function glp_mpl_postsolve(tran:Pglp_tran; prob:Pglp_prob; sol:longint):longint; external GLPKLIB;
  procedure glp_mpl_free_wksp(tran:Pglp_tran); external GLPKLIB;
  function glp_read_cnfsat(P:Pglp_prob; fname:Pchar):longint; external GLPKLIB;
  function glp_check_cnfsat(P:Pglp_prob):longint; external GLPKLIB;
  function glp_write_cnfsat(P:Pglp_prob; fname:Pchar):longint; external GLPKLIB;
  function glp_minisat1(P:Pglp_prob):longint external GLPKLIB;
  function glp_intfeas1(P:Pglp_prob; use_bound:longint; obj_bound:longint):longint external GLPKLIB;
  function glp_init_env:longint external GLPKLIB;
  function glp_version:Pchar external GLPKLIB;
  function glp_config(option:Pchar):Pchar external GLPKLIB;
  function glp_free_env:longint external GLPKLIB;
  procedure glp_puts(s:Pchar) external GLPKLIB;
  procedure glp_printf(fmt:Pchar) external GLPKLIB;

  (*???rch
  procedure glp_vprintf(fmt:Pchar; arg:va_list) external GLPKLIB;
  *)
  function glp_term_out(flag:longint):longint external GLPKLIB;
  procedure glp_term_hook(func: TTermHook; info:pointer) external GLPKLIB;
  function glp_open_tee(name:Pchar):longint external GLPKLIB;
  function glp_close_tee:longint external GLPKLIB;

  (*???rch
  { was #define dname def_expr }
  function glp_error : longint; { return type might be wrong }
    begin
      glp_error:=glp_error_(__FILE__,__LINE__);
    end;
*)
  function glp_error_(file_:Pchar; line:longint):glp_errfunc external GLPKLIB;
  function glp_at_error:longint external GLPKLIB;
  procedure glp_assert_(expr:Pchar; file_:Pchar; line:longint) external GLPKLIB;
  procedure glp_error_hook( func: TErrorHook; info:pointer) external GLPKLIB;

  { was #define dname(params) para_def_expr }
  { argument types are unknown }
  { return type might be wrong }   
  function glp_malloc(size : longint) : pointer;
  begin
    glp_malloc:=glp_alloc(1,size);
  end;

  { was #define dname(params) para_def_expr }
  { argument types are unknown }
  { return type might be wrong }   
  function glp_calloc(n,size : longint) : pointer;
  begin
    glp_calloc:=glp_alloc(n,size);
  end;

  function glp_alloc(n:longint; size:longint):pointer external GLPKLIB;
  function glp_realloc(ptr:pointer; n:longint; size:longint):pointer external GLPKLIB;
  procedure glp_free(ptr:pointer) external GLPKLIB;
  procedure glp_mem_limit(limit:longint) external GLPKLIB;
  procedure glp_mem_usage(count:Plongint; cpeak:Plongint; total:Psize_t; tpeak:Psize_t) external GLPKLIB;
  function glp_time:double external GLPKLIB;
  function glp_difftime(t1:double; t0:double):double external GLPKLIB;
  function glp_create_graph(v_size:longint; a_size:longint):Pglp_graph external GLPKLIB;
  procedure glp_set_graph_name(G:Pglp_graph; name:Pchar) external GLPKLIB;
  function glp_add_vertices(G:Pglp_graph; nadd:longint):longint external GLPKLIB;
  procedure glp_set_vertex_name(G:Pglp_graph; i:longint; name:Pchar) external GLPKLIB;
  function glp_add_arc(G:Pglp_graph; i:longint; j:longint):Pglp_arc external GLPKLIB;
  procedure glp_del_vertices(G:Pglp_graph; ndel:longint; num:Plongint) external GLPKLIB;
  procedure glp_del_arc(G:Pglp_graph; a:Pglp_arc) external GLPKLIB;
  procedure glp_erase_graph(G:Pglp_graph; v_size:longint; a_size:longint) external GLPKLIB;
  procedure glp_delete_graph(G:Pglp_graph) external GLPKLIB;
  procedure glp_create_v_index(G:Pglp_graph) external GLPKLIB;
  function glp_find_vertex(G:Pglp_graph; name:Pchar):longint external GLPKLIB;
  procedure glp_delete_v_index(G:Pglp_graph) external GLPKLIB;
  function glp_read_graph(G:Pglp_graph; fname:Pchar):longint external GLPKLIB;
  function glp_write_graph(G:Pglp_graph; fname:Pchar):longint external GLPKLIB;
  procedure glp_mincost_lp(P:Pglp_prob; G:Pglp_graph; names:longint; v_rhs:longint; a_low:longint; 
              a_cap:longint; a_cost:longint) external GLPKLIB;
  function glp_mincost_okalg(G:Pglp_graph; v_rhs:longint; a_low:longint; a_cap:longint; a_cost:longint; 
             sol:Pdouble; a_x:longint; v_pi:longint):longint external GLPKLIB;
  function glp_mincost_relax4(G:Pglp_graph; v_rhs:longint; a_low:longint; a_cap:longint; a_cost:longint; 
             crash:longint; sol:Pdouble; a_x:longint; a_rc:longint):longint external GLPKLIB;
  procedure glp_maxflow_lp(P:Pglp_prob; G:Pglp_graph; names:longint; s:longint; t:longint; 
              a_cap:longint) external GLPKLIB;
  function glp_maxflow_ffalg(G:Pglp_graph; s:longint; t:longint; a_cap:longint; sol:Pdouble; 
             a_x:longint; v_cut:longint):longint external GLPKLIB;
  function glp_check_asnprob(G:Pglp_graph; v_set:longint):longint external GLPKLIB;
  function glp_asnprob_lp(P:Pglp_prob; form:longint; G:Pglp_graph; names:longint; v_set:longint; 
             a_cost:longint):longint external GLPKLIB;
  function glp_asnprob_okalg(form:longint; G:Pglp_graph; v_set:longint; a_cost:longint; sol:Pdouble; 
             a_x:longint):longint external GLPKLIB;
  function glp_asnprob_hall(G:Pglp_graph; v_set:longint; a_x:longint):longint external GLPKLIB;
  function glp_cpp(G:Pglp_graph; v_t:longint; v_es:longint; v_ls:longint):double external GLPKLIB;
  function glp_read_mincost(G:Pglp_graph; v_rhs:longint; a_low:longint; a_cap:longint; a_cost:longint; 
             fname:Pchar):longint external GLPKLIB;
  function glp_write_mincost(G:Pglp_graph; v_rhs:longint; a_low:longint; a_cap:longint; a_cost:longint; 
             fname:Pchar):longint external GLPKLIB;
  function glp_read_maxflow(G:Pglp_graph; s:Plongint; t:Plongint; a_cap:longint; fname:Pchar):longint external GLPKLIB;
  function glp_write_maxflow(G:Pglp_graph; s:longint; t:longint; a_cap:longint; fname:Pchar):longint external GLPKLIB;
  function glp_read_asnprob(G:Pglp_graph; v_set:longint; a_cost:longint; fname:Pchar):longint external GLPKLIB;
  function glp_write_asnprob(G:Pglp_graph; v_set:longint; a_cost:longint; fname:Pchar):longint external GLPKLIB;
  function glp_read_ccdata(G:Pglp_graph; v_wgt:longint; fname:Pchar):longint external GLPKLIB;
  function glp_write_ccdata(G:Pglp_graph; v_wgt:longint; fname:Pchar):longint external GLPKLIB;
  function glp_netgen(G:Pglp_graph; v_rhs:longint; a_cap:longint; a_cost:longint; parm: TArr16LongInt ):longint external GLPKLIB;
  procedure glp_netgen_prob(nprob:longint; parm:TArr16LongInt) external GLPKLIB;
  function glp_gridgen(G:Pglp_graph; v_rhs:longint; a_cap:longint; a_cost:longint; parm: TArr14LongInt):longint external GLPKLIB;
  function glp_rmfgen(G:Pglp_graph; s:Plongint; t:Plongint; a_cap:longint; parm: TArr5LongInt ):longint external GLPKLIB;
  function glp_weak_comp(G:Pglp_graph; v_num:longint):longint external GLPKLIB;
  function glp_strong_comp(G:Pglp_graph; v_num:longint):longint external GLPKLIB;
  function glp_top_sort(G:Pglp_graph; v_num:longint):longint external GLPKLIB;
  function glp_wclique_exact(G:Pglp_graph; v_wgt:longint; sol:Pdouble; v_set:longint):longint external GLPKLIB;

end.
