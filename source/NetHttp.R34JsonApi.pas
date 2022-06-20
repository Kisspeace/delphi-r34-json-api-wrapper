//♡2022 by Kisspeace. https://github.com/kisspeace
unit NetHttp.R34JsonApi;

interface
uses
  XSuperObject, Sysutils, Net.HttpClient,
  Net.HttpClientComponent, R34JsonApi.Types;

const
  R34_API_URL = 'https://r34-json-api.herokuapp.com';

type

  TR34Client = class(TObject)
    public
      WebClient: TNetHttpClient;
      function GetPosts(ATags: string; APid: integer = 1; ALimit: byte = 100): TR34Items;
      function GetComments(APostId: string): TR34Comments;
      constructor Create;
      destructor Destroy; override;
  end;

implementation

{ TR34Client }

constructor TR34Client.Create;
begin
  WebClient := TNetHttpClient.Create(nil);
end;

destructor TR34Client.Destroy;
begin
  WebClient.Free;
  inherited;
end;

function TR34Client.GetComments(APostId: string): TR34Comments;
var
  X: ISuperArray;
  Response: IHTTPResponse;
begin
  Result := nil;
  Response := WebClient.Get(R34_API_URL + '/comments?post_id=' + APostId);
  X := SA(Response.ContentAsString);
  Result := TJson.Parse<TR34Comments>(X);
end;

function TR34Client.GetPosts(ATags: string; APid: integer;
  ALimit: byte): TR34Items;
var
  X: ISuperArray;
  Response: IHTTPResponse;
begin
  Result := nil;
  Response := WebClient.Get(R34_API_URL + '/posts?tags=' + ATags +
   '&pid=' + APid.ToString + '&limit=' + Alimit.ToString);

  try
    X := SA(Response.ContentAsString);
    Result := TJson.Parse<TR34Items>(X);
  except
    Result := nil;
  end;
end;

end.
