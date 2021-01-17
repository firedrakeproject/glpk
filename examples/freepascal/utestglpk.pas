unit utestglpk;
(*
Examples of use of glpk from freepascal.
*)
{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, glpk;

type

  { TForm1 }

  TForm1 = class(TForm)
    btExample1: TButton;
    btExample2: TButton;
    procedure btExample1Click(Sender: TObject);
    procedure btExample2Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.btExample1Click(Sender: TObject);
var
  P: Pglp_prob;
begin
    P:= glp_create_prob();
    glp_read_mps(P, GLP_MPS_DECK, NIL, '25fv47.mps' );
    glp_adv_basis(P, 0);
    glp_simplex(P, NIL);
    glp_print_sol(P, '25fv47.txt');
    glp_delete_prob(P);
end;

procedure TForm1.btExample2Click(Sender: TObject);
var
  lp: Pglp_prob;
  ia: array[0..1+1000] of integer;
  ja: array[0..1+1000] of integer;
  ar: array[0..1+1000] of double;
  z, x1, x2, x3: double;

begin
   lp:= glp_create_prob();
   glp_set_prob_name(lp, 'sample');
   glp_set_obj_dir(lp, GLP_MAX);
   glp_add_rows(lp, 3);
   glp_set_row_name(lp, 1, 'p' );
   glp_set_row_bnds(lp, 1, GLP_UP, 0.0, 100.0);
   glp_set_row_name(lp, 2, 'q');
   glp_set_row_bnds(lp, 2, GLP_UP, 0.0, 600.0);
   glp_set_row_name(lp, 3, 'r');
   glp_set_row_bnds(lp, 3, GLP_UP, 0.0, 300.0);
   glp_add_cols(lp, 3);
   glp_set_col_name(lp, 1, 'x1');
   glp_set_col_bnds(lp, 1, GLP_LO, 0.0, 0.0);
   glp_set_obj_coef(lp, 1, 10.0);
   glp_set_col_name(lp, 2, 'x2');
   glp_set_col_bnds(lp, 2, GLP_LO, 0.0, 0.0);
   glp_set_obj_coef(lp, 2, 6.0);
   glp_set_col_name(lp, 3, 'x3');
   glp_set_col_bnds(lp, 3, GLP_LO, 0.0, 0.0);
   glp_set_obj_coef(lp, 3, 4.0);
   ia[1]:= 1; ja[1]:= 1; ar[1]:=  1.0; { a[1;1]:=  1 }
  ia[2]:= 1; ja[2]:= 2; ar[2]:=  1.0; { a[1;2]:=  1 }
  ia[3]:= 1; ja[3]:= 3; ar[3]:=  1.0; { a[1;3]:=  1 }
  ia[4]:= 2; ja[4]:= 1; ar[4]:= 10.0; { a[2;1]:= 10 }
  ia[5]:= 3; ja[5]:= 1; ar[5]:=  2.0; { a[3;1]:=  2 }
   ia[6]:= 2; ja[6]:= 2; ar[6]:=  4.0; { a[2;2]:=  4 }
  ia[7]:= 3; ja[7]:= 2; ar[7]:=  2.0; { a[3;2]:=  2 }
  ia[8]:= 2; ja[8]:= 3; ar[8]:=  5.0; { a[2;3]:=  5 }
  ia[9]:= 3; ja[9]:= 3; ar[9]:=  6.0; { a[3;3]:=  6 }
  glp_load_matrix(lp, 9, ia, ja, ar);
  glp_simplex(lp, nil);
  z := glp_get_obj_val(lp);
  x1 := glp_get_col_prim(lp, 1);
  x2 := glp_get_col_prim(lp, 2);
  x3 := glp_get_col_prim(lp, 3);

  writeln( FORMAT( 'z = %g; x1 = %g; x2 = %g; x3 = %g', [ z, x1, x2, x3 ] ));
  glp_delete_prob(lp);
end;

end.

