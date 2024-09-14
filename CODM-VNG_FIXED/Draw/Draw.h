void RenderLine(const ImVec2& from, const ImVec2& to, ImColor Color, float thickness)
{
    ImDrawList* draw_list = ImGui::GetForegroundDrawList();
    draw_list->AddLine(from, to, Color, thickness);
}

void DrawBox(float X, float Y, float W, float H, ImColor Color, float curve, float thickness)
{
	ImDrawList* draw_list = ImGui::GetForegroundDrawList();
	draw_list->AddRect(ImVec2(X + 1, Y + 1), ImVec2(((X + W) - 1), ((Y + H) - 1)), Color);
	draw_list->AddRect(ImVec2(X, Y), ImVec2(X + W, Y + H), Color, curve, thickness);
}

void DrawText2(ImFont * _espFont, float fontSize, ImVec2 position, ImColor Color, const char *text, ImColor colorFilled)
{
    ImGui::GetBackgroundDrawList()->AddRectFilled(ImVec2(position.x-3,position.y-3), ImVec2(position.x + _espFont->CalcTextSizeA(fontSize, MAXFLOAT, 0.0f, text).x + 3, position.y + 12), colorFilled, 0, 0);
    ImDrawList* draw_list = ImGui::GetForegroundDrawList();
    draw_list->AddText(NULL, fontSize, position, Color, text);
}

void drawRectFilledWithPos(ImVec2 pos, ImVec2 size, ImColor color)
{
    ImGui::GetBackgroundDrawList()->AddRectFilled(pos, ImVec2(pos.x + size.x, pos.y + size.y), color, 0, 0);
}

void hpasddsfhjdjhsbsd(float hp, float maxHp, float xh, float yh) //Draw health
{
    float rate = 1.0f * hp/ maxHp;
    float width = 50 ;
    float height = 4;
    float x = xh - width * 0.5;
    float y = yh - height - 0;
    
    ImColor color = ImColor(0,255,0);

    if (rate < 0.35) {
        color = ImColor(255,0,0);
    } else if (rate < 0.75) {
        color = ImColor(255,165,0);
    }

    drawRectFilledWithPos(ImVec2(x, y), ImVec2(width * rate, height), color);
}