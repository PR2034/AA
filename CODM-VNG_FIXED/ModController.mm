#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import <Metal/Metal.h>
#import <MetalKit/MetalKit.h>

#include "imgui/imgui.h"
#include "imgui/imgui_impl_metal.h"

#import "Utilities/Macros.h"
#import "Utilities/Obfuscate.h"
#import "Utilities/XORstring.h"

#import "UnityStructs/Vector3.h"
#import "UnityStructs/Vector2.h"
#import "UnityStructs/Vector4.h"
#import "UnityStructs/Matrix4x4.h"
#import "UnityStructs/Unity.h"

#import "Draw/Draw.h"

#include "CheatState/CheatState.hpp"

#include "ModController.h"

#include "font.h"
#include "iconcpp.h"
#include "icons.h"

#import "Stream/HeeeNoScreenShotView.h"

#import "Hosts/NSObject+URL.h"

#define kWidth  [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height
#define kScale [UIScreen mainScreen].scale

@interface InheritGesture : UITapGestureRecognizer
    @property (nonatomic) int number;
    @property (nonatomic) NSString *text;
    @property (nonatomic) void (*ptr)();
@end

@implementation InheritGesture: UITapGestureRecognizer
@end

@implementation ModController

void *(*kshifuifhihfp)()= (void *(*)())getRealOffset(0x1068BDDB4); //Camera_get_main
void *(*oidfodiofddf)(void *component) = (void *(*)(void *))getRealOffset(0x1068C36CC); //Component_GetTransform
void (*jiifjei8999dd)(void *transform, Vector3 *out) = (void (*)(void *, Vector3 *))getRealOffset(0x106936670); //Transform_INTERNAL_get_position
Vector3 uriyruufgdsfhbf(void *player) 
{ //USANDO JUGADOR
  Vector3 location;
  jiifjei8999dd(oidfodiofddf(player), &location);//Transform_INTERNAL_get_position//Component_GetTransform
  return location;
}
Vector3 iuiieruwiwueiweuiw(void *transform) 
{ //USANDO TRANSFORM
  Vector3 location;
  jiifjei8999dd(transform, &location);//Transform_INTERNAL_get_position
  return location;
}
void (*fdjdkfd8difhdj)(void *transform, Vector3 *out) = (void (*)(void *, Vector3 *))getRealOffset(0x10691B9DC); //Transform_INTERNAL_get_localPosition
Vector3 poposdshdjshd(void *player) 
{
  Vector3 location;
  fdjdkfd8difhdj(oidfodiofddf(player), &location);//Transform_INTERNAL_get_localPosition//Component_GetTransform
  return location;
}
Matrix4x4 (*dfjd8dfhjdfjd)(void* camera) = (Matrix4x4(*)(void*))getRealOffset(0x1068BD6C8); //camera_worldToCameraMatrix
Matrix4x4 adsad() 
{
    if(kshifuifhihfp() != nullptr){//Camera_get_main
        return dfjd8dfhjdfjd(kshifuifhihfp());//camera_worldToCameraMatrix//Camera_get_main
    }
    return Matrix4x4();
}
Matrix4x4 (*dsoifpif888999fdk)(void* camera) = (Matrix4x4(*)(void*))getRealOffset(0x1068BD7B0); //camera_get_projectionMatrix
Matrix4x4 dsjdksdksdj() 
{
    if(kshifuifhihfp() != nullptr){//Camera_get_main
        return dsoifpif888999fdk(kshifuifhihfp());//camera_get_projectionMatrix//Camera_get_main
    }
    return Matrix4x4();
}
void* (*jigjdis4jkrsds)() = (void *(*)())getRealOffset(0x1018A7374); //Gameplay_get_game
bool (*kgjdkgfgd99)(void * info) = (bool (*)(void *))getRealOffset(0x1010FA0A4); //get_isAlive
bool (*fkdfmkd5655kk)(void * info) = (bool (*)(void *))getRealOffset(0x101B67518); //get_isRobot
float (*adsdsdbjfh6y6y)(void * pawn) = (float (*)(void*))getRealOffset(0x1010F652C); //get_health

Vector4 ewyetwqyet66(Vector3 pos, Matrix4x4 modelViewMatrix) //getViewCords
{
    Vector4 viewPos = Vector4(0,0,0,0);
    viewPos.X = pos.x * modelViewMatrix[0][0] + pos.y * modelViewMatrix[1][0] + pos.z * modelViewMatrix[2][0] + modelViewMatrix[3][0];
    viewPos.Y = pos.x * modelViewMatrix[0][1] + pos.y * modelViewMatrix[1][1] + pos.z * modelViewMatrix[2][1] + modelViewMatrix[3][1];
    viewPos.Z = pos.x * modelViewMatrix[0][2] + pos.y * modelViewMatrix[1][2] + pos.z * modelViewMatrix[2][2] + modelViewMatrix[3][2];
    viewPos.W = pos.x * modelViewMatrix[0][3] + pos.y * modelViewMatrix[1][3] + pos.z * modelViewMatrix[2][3] + modelViewMatrix[3][3];
    return viewPos;
}
Vector4 ooo8d99ooo(Vector4 pos, Matrix4x4 projectionMatrix) //getClipCords
{
    Vector4 clipPos = Vector4(0,0,0,0);
    clipPos.X = pos.X * projectionMatrix[0][0] + pos.Y * projectionMatrix[1][0] + pos.Z * projectionMatrix[2][0] + pos.W * projectionMatrix[3][0];
    clipPos.Y = pos.X * projectionMatrix[0][1] + pos.Y * projectionMatrix[1][1] + pos.Z * projectionMatrix[2][1] + pos.W * projectionMatrix[3][1];
    clipPos.Z = pos.X * projectionMatrix[0][2] + pos.Y * projectionMatrix[1][2] + pos.Z * projectionMatrix[2][2] + pos.W * projectionMatrix[3][2];
    clipPos.W = pos.X * projectionMatrix[0][3] + pos.Y * projectionMatrix[1][3] + pos.Z * projectionMatrix[2][3] + pos.W * projectionMatrix[3][3];
    return clipPos;
}
Vector3 uiiuiuiiuiiuiiu(Vector4 pos) //getNormalizedCords
{
    Vector3 normalized = Vector3(0,0,0);
    normalized.x = pos.X/pos.W;
    normalized.y = pos.Y/pos.W;
    normalized.z = pos.Z/pos.W;
    return normalized;
}
Vector2 dass7d8sa7d8as(Vector3 pos) //getScreenCords
{
    Vector2 screen = Vector2(0,0);
    screen.X = (kWidth/2.0 * pos.x) + (pos.x + kWidth/2.0);
    screen.Y = -(kHeight/2.0 * pos.y) + (pos.y + kHeight/2.0);
    return screen;
}
NSString * ffoo6o6o6666666(float distance, void* m_EnemyInfo) //getNameEnemy
{
    NSString *dis = [NSString stringWithFormat:@"%d",(int)distance];
    _monoString * m_NickName = *(_monoString **)((uint64_t)m_EnemyInfo + 0x140);
    NSString *nameEnemy = m_NickName->toNSString();
    bool isRobot;
    if(*fkdfmkd5655kk!= nullptr){
        isRobot = fkdfmkd5655kk(m_EnemyInfo);
    } else {
        isRobot = false;
    }
    if(isRobot || nameEnemy.length == 0) {
        nameEnemy = @"[AI]";
    }
    NSString *nameAndDis = [NSString stringWithFormat:@"[%@M] %@", dis, nameEnemy];
    return nameAndDis;
}

static bool MenDeal = true;
ImFont *_espFont;
HeeeNoScreenShotView *noScreenShotView;
UILabel *menuTitle;

-(BOOL)shouldAutorotate
{
    return NO;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return NO;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return UIInterfaceOrientationLandscapeRight;
}

-(instancetype)initWithNibName:(nullable NSString *)nibNameOrNil bundle:(nullable NSBundle *)nibBundleOrNil //id
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    _device = MTLCreateSystemDefaultDevice();
    _commandQueue = [_device newCommandQueue];
    if (!self.device)
    {
        NSLog(@"Metal is not supported");
        abort();
    }
    menuTitle = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 30)];
	menuTitle.text = [NSString stringWithUTF8String:make_string("R6X9 COD MOBILE GLOBAL 1.0.38").c_str()];
	menuTitle.textColor = UIColorFromHex(0x72FF13);
	menuTitle.font = [UIFont fontWithName:[NSString stringWithUTF8String:make_string("AppleSDGothicNeo-Light").c_str()] size:19.0f];
	menuTitle.textAlignment = NSTextAlignmentCenter;
	[menuTitle sizeToFit]; //make container the same size as the resulting text
    UIWindow *mainWindow = [UIApplication sharedApplication].keyWindow;
	menuTitle.center = CGPointMake(CGRectGetMidX(mainWindow.bounds), 20);
	menuTitle.adjustsFontSizeToFitWidth = true;
    [mainWindow addSubview: menuTitle];
    IMGUI_CHECKVERSION();
    ImGui::CreateContext();
    ImGuiIO& io = ImGui::GetIO(); (void)io;
    ImGui::StyleColorsDark();
    NSString *FontPath = @"/System/Library/Fonts/AppFonts/AppleGothic.otf";
    //_espFont = io.Fonts->AddFontFromFileTTF(FontPath.UTF8String, 40.f,NULL,io.Fonts->GetGlyphRangesChineseSimplifiedCommon());
    static const ImWchar icons_ranges[] = { 0xf000, 0xf3ff, 0 };
    ImFontConfig icons_config;

    ImFontConfig CustomFont;
    CustomFont.FontDataOwnedByAtlas = false;

 
    icons_config.MergeMode = true;
    icons_config.PixelSnapH = true;

    io.Fonts->AddFontFromMemoryTTF(const_cast<std::uint8_t*>(Custom), sizeof(Custom), 21.f, &CustomFont);
    _espFont=io.Fonts->AddFontFromMemoryCompressedTTF(font_awesome_data, font_awesome_size, 19.0f, &icons_config, icons_ranges);
    io.Fonts->AddFontDefault();
    ImGui_ImplMetal_Init(_device);
    return self;
}

-(MTKView *)mtkView
{
    return (MTKView *)self.view;
}

- (void)openMenu:(UITapGestureRecognizer *)tap {
    if(tap.state == UIGestureRecognizerStateEnded) {
        MenDeal = true;
    }
}

-(void)loadView
{
    CGFloat w = [UIApplication sharedApplication].windows[0].rootViewController.view.frame.size.width;
    CGFloat h = [UIApplication sharedApplication].windows[0].rootViewController.view.frame.size.height;
    self.view = [[MTKView alloc] initWithFrame:CGRectMake(0, 0, w, h)];
    noScreenShotView = [[HeeeNoScreenShotView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    noScreenShotView.backgroundColor = [UIColor clearColor];
    noScreenShotView.userInteractionEnabled = NO;
    [[UIApplication sharedApplication].keyWindow addSubview:noScreenShotView];
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    self.mtkView.device = self.device;
    self.mtkView.delegate = self;
    self.mtkView.clearColor = MTLClearColorMake(0, 0, 0, 0);
    self.mtkView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
    self.mtkView.clipsToBounds = YES;
    self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    self.window.rootViewController = self;
    self.window.hidden = NO;
    self.view.hidden = NO;
    [noScreenShotView addSubview:self.window];
    UIWindow *mainWindow = [UIApplication sharedApplication].keyWindow;
    UITapGestureRecognizer *tapGestureRecognizerMenuH = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(openMenu:)];
    tapGestureRecognizerMenuH.numberOfTapsRequired = 3;
    tapGestureRecognizerMenuH.numberOfTouchesRequired = 3;
    [mainWindow addGestureRecognizer: tapGestureRecognizerMenuH];
    //[self.window makeKeyAndVisible];
}

#pragma mark - MTKViewDelegate

-(void)drawInMTKView:(MTKView*)view
{
    ImGuiIO& io = ImGui::GetIO();
    //ImGui::StyleColorsDarkMode();
    io.DisplaySize.x = view.bounds.size.width;
    io.DisplaySize.y = view.bounds.size.height;
    CGFloat framebufferScale = view.window.screen.scale ?: UIScreen.mainScreen.scale;
    io.DisplayFramebufferScale = ImVec2(framebufferScale, framebufferScale);
    io.DeltaTime = 1 / float(view.preferredFramesPerSecond ?: 60);
    id<MTLCommandBuffer> commandBuffer = [self.commandQueue commandBuffer];
    MTLRenderPassDescriptor* renderPassDescriptor = view.currentRenderPassDescriptor;
    if (renderPassDescriptor == nil)
    {
        [commandBuffer commit];
		return;
    }

    if (MenDeal == true) {
        [self.view setUserInteractionEnabled:YES];
        [self.window setUserInteractionEnabled:YES];
    } else if (MenDeal == false) {
        [self.view setUserInteractionEnabled:NO];
        [self.window setUserInteractionEnabled:NO];
    }

    ImGui_ImplMetal_NewFrame(renderPassDescriptor);
    ImGui::NewFrame();
    ImFont* font = ImGui::GetFont();
    font->Scale = 16.f / font->FontSize;
    CGFloat x = (([UIApplication sharedApplication].windows[0].rootViewController.view.frame.size.width) - 380) / 2;
    CGFloat y = (([UIApplication sharedApplication].windows[0].rootViewController.view.frame.size.height) - 260) / 2;
    ImGui::SetNextWindowPos(ImVec2(x, y), ImGuiCond_FirstUseEver);
   if (MenDeal == true)
    {
        ImGui::Begin(make_string("R6X9 ~ Call of Duty© Mobile Global | 1.0.38").c_str(), &MenDeal, ImGuiWindowFlags_AlwaysAutoResize);
        ImGui::PushItemWidth(ImGui::GetWindowWidth() * 0.55f);
        if (ImGui::BeginTabBar(make_string("##tabbarmain").c_str())) {
            /*if (ImGui::BeginTabItem("Aim")){
                ImGui::Spacing();
                ImGui::Combo("Aim Variety", &aimAssistPosition, "Aimbot 30%\0Aimbot 50%\0Disable\0");
                ImGui::Checkbox("No Recoil", &enable_recoil); 
                ImGui::EndTabItem();
            }*/
            if (ImGui::BeginTabItem(make_string(ICON_FA_EYE " Esp").c_str())){
                ImGui::Spacing();
                ImGui::Checkbox(make_string("Enable Esp").c_str(), &CheatState::show_esp);
                ImGui::Separator();
                ImGui::Checkbox(make_string("Esp - Lines").c_str(), &CheatState::show_esplines);
                ImGui::Checkbox(make_string("Esp - Boxes").c_str(), &CheatState::show_espboxes);
                ImGui::Checkbox(make_string("Esp - Info").c_str(), &CheatState::show_espinfo);
                ImGui::Separator();
                ImGui::SliderInt(make_string("Esp - Distance").c_str(), &CheatState::distanceValue, 0, 200); 
                ImGui::Spacing();
                ImGui::EndTabItem();
            }
            if (ImGui::BeginTabItem(make_string(ICON_FA_COGS " Settings").c_str())){
                ImGui::Checkbox(make_string("Stream Mode").c_str(), &CheatState::stream_mode);
                ImGui::Spacing();
                ImGui::Checkbox(make_string("Hide Top Label").c_str(), &CheatState::hide_top_label);
                ImGui::Spacing();
                ImGui::Checkbox(make_string("Circle FOV").c_str(), &CheatState::enable_circleFov); 
                ImGui::Spacing();
                ImGui::SliderInt(make_string("Circle Size").c_str(), &CheatState::circleSizeValue, 0, 255); 
                ImGui::Spacing();
                ImGui::ColorEdit3(make_string("Color Esp").c_str(), &*(float*)CheatState::colorEsp, ImGuiColorEditFlags_NoInputs);
                ImGui::Spacing();
                if (ImGui::Combo(make_string("Color Menu").c_str(), &CheatState::style_idx, "Dark\0Light\0Classic\0"))//if (ImGui::Combo("Color Menu", &style_idx, "Dark Custom\0Dark Normal\0Light\0Classic\0"))
                {
                    switch (CheatState::style_idx)
                    {
                        //case 0: ImGui::StyleColorsDarkMode(); break;
                        case 0: ImGui::StyleColorsDark(); break;
                        case 1: ImGui::StyleColorsLight(); break;
                        case 2: ImGui::StyleColorsClassic(); break;
                    }
                }
                ImGui::Spacing();
                ImGui::EndTabItem();
            }
            ImGui::EndTabBar();
        }
        ImGui::Spacing();
        ImGui::Separator();
        ImGui::Spacing();
        ImGui::Text("This is a working build for R6X9 CODM Cheat Menu\n%.3f ms/frame (%.1f FPS)", 60.0f / ImGui::GetIO().Framerate, ImGui::GetIO().Framerate);
        ImGui::End();
    }

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [NSObject load];
    });

    if(CheatState::stream_mode){
        [noScreenShotView setSecure: YES];
    } else if(CheatState::stream_mode == false) {
        [noScreenShotView setSecure: NO];
    }

    if(CheatState::hide_top_label) {
        menuTitle.hidden = YES;
    } else {
         menuTitle.hidden = NO;
    }

    if(CheatState::show_esp){
        if (*jigjdis4jkrsds) {
            auto game = jigjdis4jkrsds();
            if(game != nullptr) {
                Matrix4x4 viewMatrix = adsad();
                Matrix4x4 projectionMatrix = dsjdksdksdj();
                monoList<void **> *EnemyPawns = *(monoList<void **>**)((uint64_t)game + 0x158);
                if(EnemyPawns != nullptr) {
                    int enemyCount = EnemyPawns->getSize();
                    for (int i = 0; i < enemyCount; i++){
                        void* m_EnemyInfo = *(void **)((uint64_t)EnemyPawns->getItems()[i] + 0x590);
                        //bool (*ishidden)(void * info) = (bool (*)(void *))getRealOffset(0x1041271C0);
                        if(m_EnemyInfo != nullptr) {
                            //void* m_meshEnemy = *(void **)((uint64_t)EnemyPawns->getItems()[i] + 0x628);
                            Vector3 enemyPositionWorld = uriyruufgdsfhbf(EnemyPawns->getItems()[i]);
                            Vector4 enemyPositionView = ewyetwqyet66(enemyPositionWorld, viewMatrix);
                            Vector4 enemyPositionclip = ooo8d99ooo(enemyPositionView, projectionMatrix);
                            Vector3 enemyPositionNormalized = uiiuiuiiuiiuiiu(enemyPositionclip);
                            Vector2 enemyPositionScreen = dass7d8sa7d8as(enemyPositionNormalized);
                            void* m_headBone = *(void **)((uint64_t)EnemyPawns->getItems()[i] + 0x2E8);
                            if(m_headBone!=nullptr) {
                                Vector3 enemyHeadPositionWorld = iuiieruwiwueiweuiw(m_headBone);
                                Vector4 enemyHeadPositionView = ewyetwqyet66(enemyHeadPositionWorld, viewMatrix);
                                Vector4 enemyHeadPositionclip = ooo8d99ooo(enemyHeadPositionView, projectionMatrix);
                                enemyHeadPositionclip.Y = enemyHeadPositionclip.Y +.5f;
                                Vector3 enemyHeadPositionNormalized = uiiuiuiiuiiuiiu(enemyHeadPositionclip);
                                Vector2 enemyHeadPositionScreen = dass7d8sa7d8as(enemyHeadPositionNormalized);
                                bool facing;
                                if(enemyPositionclip.Z < 0.01f){
                                    facing = false;
                                } else {
                                    facing = true;
                                }
                                bool visible = (enemyPositionScreen.X >= 0 && enemyPositionScreen.X <=kWidth) /*&& (enemyPositionScreen.Y >= 0 && enemyPositionScreen.Y <=kHeight)*/;
                                if(visible && facing){
                                    void* (*get_localPawn)() = (void *(*)())getRealOffset(0x1018B23D8);
                                    Vector3 localPosition = Vector3(0,0,0);
                                    if(*get_localPawn!= nullptr){
                                        if(get_localPawn() != nullptr) {
                                            //void* m_mesh = *(void **)((uint64_t)get_localPawn() + 0x628);
                                            localPosition = uriyruufgdsfhbf(get_localPawn());
                                            /*_monoString* (*get_tag)(void * componet) = *(_monoString* (*)(void *))getRealOffset(0x104EBD260);
                                            _monoString * tag = get_tag(EnemyPawns->getItems()[i]);
                                            NSLog(@"%@ TAAAAAAAG",tag->toNSString());*/
                                        }
                                    }
                                    //bool (*get_isVisible)(void * renderer) = (bool (*)(void *))getRealOffset(0x104F139BC);
                                    //bool (*Raycast)(Vector3 mypos, Vector3 yourPos, RaycastHit * out) = (bool (*)(Vector3, Vector3,RaycastHit *))getRealOffset(0x104F06E24); //Cambiar por linecast
                                    //Vector3 direction = localPosition - enemyPositionWorld;
                                    //Vector3 distanceN = Vector3::Normalized(direction);
                                    /*RaycastHit out;
                                    Raycast(enemyPositionWorld, distanceN, &out);*/
                                    float distance = Vector3::Distance(localPosition, enemyPositionWorld);
                                    bool shouldShow = CheatState::distanceValue >= distance;
                                    NSString *nickname = ffoo6o6o6666666(distance, m_EnemyInfo); //Usar getChars

                                    bool isLive;
                                    if(*kgjdkgfgd99!= nullptr){
                                        isLive = kgjdkgfgd99(EnemyPawns->getItems()[i]);
                                    }
                                    if(CheatState::show_esplines && isLive){
                                        if(CheatState::show_espinfo){
                                            RenderLine(ImVec2(kWidth / 2, 0), ImVec2(enemyHeadPositionScreen.X,enemyHeadPositionScreen.Y-20), ImColor(CheatState::colorEsp[0], CheatState::colorEsp[1], CheatState::colorEsp[2]), 0.9);
                                        } else {
                                            RenderLine(ImVec2(kWidth / 2, 0), ImVec2(enemyHeadPositionScreen.X,enemyHeadPositionScreen.Y), ImColor(CheatState::colorEsp[0], CheatState::colorEsp[1], CheatState::colorEsp[2]), 0.9);
                                        }
                                    }
                                    if(CheatState::show_espinfo && shouldShow && isLive) {
                                        ImVec2 nicknameWidth = _espFont->CalcTextSizeA(12.0f, MAXFLOAT, 0.0f, [nickname UTF8String]);
                                        DrawText2(_espFont, 12, ImVec2(enemyHeadPositionScreen.X - (nicknameWidth.x/2.0f),enemyHeadPositionScreen.Y-16), ImColor(255,255,51), [nickname UTF8String], ImColor(0,0,0,190));
                                        float health = 0.0f;
                                        float maxHealth = 0.0f;
                                        if(*adsdsdbjfh6y6y != nullptr){
                                            health = adsdsdbjfh6y6y(EnemyPawns->getItems()[i]);
                                        }                            
                                        void* m_AttackableInfo = *(void **)((uint64_t)EnemyPawns->getItems()[i] + 0x78);
                                        maxHealth = *(float *)((uint64_t)m_AttackableInfo + 0x38);
                                        hpasddsfhjdjhsbsd(health, maxHealth, enemyHeadPositionScreen.X, enemyHeadPositionScreen.Y);
                                    }
                                    if(CheatState::show_espboxes && shouldShow && isLive){
                                        float height =  abs(enemyPositionScreen.Y - enemyHeadPositionScreen.Y);
                                        float width = height * 0.65f;
                                        DrawBox(enemyHeadPositionScreen.X - (width * 0.5),  enemyHeadPositionScreen.Y, width, height, ImColor(CheatState::colorEsp[0], CheatState::colorEsp[1], CheatState::colorEsp[2]),0.9, 0.9);
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    } 

    auto Draw = ImGui::GetBackgroundDrawList();
    if (CheatState::enable_circleFov)
    {
         Draw->AddCircle(ImVec2(kWidth/2, kHeight/2), CheatState::circleSizeValue, IM_COL32(255, 0, 0, 255), 100, 1.0f);
    }
    ImGui::Render();
    ImDrawData* draw_data = ImGui::GetDrawData();
    id <MTLRenderCommandEncoder> renderEncoder = [commandBuffer renderCommandEncoderWithDescriptor:renderPassDescriptor];
    [renderEncoder pushDebugGroup:@"Dear ImGui rendering Jairback"];
    ImGui_ImplMetal_RenderDrawData(draw_data, commandBuffer, renderEncoder);
    [renderEncoder popDebugGroup];
    [renderEncoder endEncoding];
    [commandBuffer presentDrawable:view.currentDrawable];
    [commandBuffer commit];
}

-(void)mtkView:(MTKView*)view drawableSizeWillChange:(CGSize)size_
{
    //NSLog(@"Size");
}

#pragma mark - Interaction
-(void)updateIOWithTouchEvent:(UIEvent *)event
{
    UITouch *anyTouch = event.allTouches.anyObject;
    CGPoint touchLocation = [anyTouch locationInView:self.view];
    ImGuiIO &io = ImGui::GetIO();
    io.AddMousePosEvent(touchLocation.x, touchLocation.y);

    BOOL hasActiveTouch = NO;
    for (UITouch *touch in event.allTouches)
    {
        if (touch.phase != UITouchPhaseEnded && touch.phase != UITouchPhaseCancelled)
        {
            hasActiveTouch = YES;
            break;
        }
    }
    io.AddMouseButtonEvent(0, hasActiveTouch);
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event      { [self updateIOWithTouchEvent:event]; }
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event      { [self updateIOWithTouchEvent:event]; }
-(void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event  { [self updateIOWithTouchEvent:event]; }
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event      { [self updateIOWithTouchEvent:event]; }

@end
