//♡2022 by Kisspeace. https://github.com/kisspeace
unit R34JsonApi.Types;

interface
uses
  Sysutils;

type

  TR34Item = record
    height: shortstring;
    score: shortstring;
    file_url: string;
    parent_id: shortstring;
    sample_url: string;
    sample_width: shortstring;
    sample_height: shortstring;
    preview_url: string;
    rating: shortstring;
    id: shortstring;
    width: shortstring;
    tags: TArray<string>;
    change: string;
    md5: shortstring;
    creator_id: shortstring;
    has_children: string;
    created_at: string;
    status: string;
    source: string;
    has_notes: string;
    has_comments: string;
    preview_width: shortstring;
    preview_height: shortstring;
    comments_url: string;
    [ALIAS('type')]
    typ: string;
    creator_url: string;
    function GetHeight: integer;
    function GetWidth: integer;
    function GetScore: integer;
    function HasChildren: boolean;
    function HasComments: boolean;
    function HasNotes: boolean;
    function TagsStr: string;
  end;

  TR34Comment = record
    created_at: string;
    post_id: shortstring;
    body: string;
    creator: string;
    id: shortstring;
    creator_id: shortstring;
    post_url: string;
  end;

  TR34Items = TArray<TR34Item>;
  TR34Comments = TArray<TR34Comment>;


implementation

{ TR34Item }

function TR34Item.GetHeight: integer;
begin
  TryStrToInt(height, result);
end;

function TR34Item.GetScore: integer;
begin
  TryStrToInt(score, result);
end;

function TR34Item.GetWidth: integer;
begin
  TryStrToInt(width, result);
end;

function TR34Item.HasChildren: boolean;
begin
  Result := (has_children = 'true');
end;

function TR34Item.HasComments: boolean;
begin
  Result := (has_comments = 'true');
end;

function TR34Item.HasNotes: boolean;
begin
  Result := (has_notes = 'true');
end;

function TR34Item.TagsStr: string;
var
  I: integer;
begin
  Result := '';
  for I := Low(tags) to High(tags) do begin
    Result := Result + ' ' + Tags[i];
  end;
end;

end.
