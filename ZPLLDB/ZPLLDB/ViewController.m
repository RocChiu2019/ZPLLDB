//
//  ViewController.m
//  ZPLLDB
//
//  Created by 赵鹏 on 2018/12/19.
//  Copyright © 2018 赵鹏. All rights reserved.
//

/**
 LLDB(Low Lever Debug)：
 默认内置于Xcode中的动态调试工具。标准的LLDB提供了一组广泛的命令，旨在与老版本的GDB命令兼容。除了使用标准配置外，还可以很容易地自定义LLDB以满足实际的需要；
 在程序运行以后，按下控制台上方的“暂停”按钮，然后控制台上就会出现"(lldb)"字样，接着就可以在控制台上撰写相关的命令了。
 
 LLDB常用命令：
 1、"breakpoint set -n XXX"：下断点命令。set是子命令；-n是选项，是--name的缩写；XXX要写将要设置断点的方法的名称；上述的这些都设置完了以后，按回车键即可下断点成功。下断点之后虽然编辑器的界面上没有断点的标志，但是程序通过当前断点接着往下运行的时候，就会在用LLDB调试工具设置的断点处停下，等待调试；
 例如，想要给"ViewController"类中的"save:"方法下断点，就要在控制台中撰写breakpoint set -n "[ViewController save:]"命令，撰写完成之后再按回车按钮，下断点就成功了；
 如果想要一并给好几个方法添加断点的话可以在控制台上写为：breakpoint set -n "[ViewController save:]" -n "[ViewController pause:]" -n "[ViewController goOn:]"，不同的方法中间用-n相连即可。写完之后按下回车按钮，在控制台上会显示：Breakpoint 1: 3 locations. 语句，这个语句的意思是把上述的三个方法分为了一组，并且在内存上下了三个断点。
 2、"breakpoint list"：查看断点列表命令；
 3、"breakpoint disable X"：禁用断点，X为组的编号；
 4、"breakpoint enable X"：启用原来被禁用掉的断点，X为组的编号；
 5、"breakpoint disable X.x"：禁用掉某一组中的某一个方法；
 6、"breakpoint delete X.x"：禁用掉某一组中的某一个方法，与上面的命令作用相同；
 7、"breakpoint enable X.x"：启用原来被禁用掉的某一组中的某一个方法；
 8、"breakpoint delete X"：删除掉某一组的断点；"delete"要删只能删整个一组的断点，不能删这个组中的某一个方法的断点；如果要写成"breakpoint disable X.x"这种样式的话，则代表禁用掉某一组中的某一个方法；
 9、"help"：LLDB中常用命令的解释；
 10、"breakpoint set --selector XXX"：给整个项目中的所有XXX方法添加断点，XXX写方法的名称即可；
 11、"breakpoint delete"：把所有的断点全都清空；
 12、"breakpoint set --file XXX --selector YYY"：给某个文件内的某个方法加断点，XXX写文件名，YYY写方法名即可。例如："breakpoint set --file ViewController.m --selector touchesBegan:withEvent:"，就是给ViewController.m文件内的"touchesBegan:withEvent:"方法添加断点；
 13、"breakpoint set -r XXX:"：遍历整个项目中带"XXX"字符的方法，并且给这些方法都加上断点；
 14、"expression"：执行代码，它的简写是"p"。可以用这个命令来查看一些东西，比如："expression self"、"expression self.view.subviews"等等；
 15、"po"：oc方法中的description方法。可以用这个命令来查看一些东西，比如："po self.view.subviews"等等；
 16、"bt"：在LLDB中直接敲"bt"命令，可以显示出调用的堆栈信息；
 17、"c"：过掉当前的断点，相当于控制台上的"Continue program execution"按钮；
 18、"n"：单步往后面执行，相当于控制台上的"Step over"按钮；
 19、"s"：继续往后面执行的时候如果遇到了函数就跳进去这个函数执行，相当于控制台上的"Step into"按钮；
 20、"ni"：与上面的"n"命令相似，只不过"n"命令是源码级别的，"ni"是汇编级别的。"ni"命令相当于当按住"control"键的时候，控制台上的"Step over"按钮；
 21、"si"：与上面的"s"命令相似，只不过"s"命令是源码级别的，"si"是汇编级别的。"si"命令相当于当按住"control"键的时候，控制台上的"Step into"按钮；
 
 在编辑器中，运行程序以后，在控制台上输入了LLDB命令，从而给程序中的某些方法加上了断点。但是，在编辑器中关闭程序运行以后，之前加的那些断点就消失了，再次运行就没有了。
 */
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark ————— 生命周期 —————
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"1");
    NSLog(@"2");
    
    [self test];
}

- (void)test
{
    NSLog(@"3");
}

#pragma mark ————— 保存 —————
- (IBAction)save:(id)sender
{
    NSLog(@"您点击了保存按钮");
}

#pragma mark ————— 暂停 —————
- (IBAction)pause:(id)sender
{
    NSLog(@"您点击了暂停按钮");
}

#pragma mark ————— 继续 —————
- (IBAction)goOn:(id)sender
{
    NSLog(@"您点击了继续按钮");
}

@end
