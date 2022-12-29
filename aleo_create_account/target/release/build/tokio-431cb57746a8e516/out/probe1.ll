; ModuleID = 'probe1.b457ac1c-cgu.0'
source_filename = "probe1.b457ac1c-cgu.0"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-macosx11.0.0"

%"core::sync::atomic::AtomicUsize" = type { i64 }
%"std::sys_common::mutex::MovableMutex" = type { %"std::sys_common::lazy_box::LazyBox<std::sys::unix::locks::pthread_mutex::Mutex>" }
%"std::sys_common::lazy_box::LazyBox<std::sys::unix::locks::pthread_mutex::Mutex>" = type { %"core::marker::PhantomData<std::sys::unix::locks::pthread_mutex::Mutex>", %"core::sync::atomic::AtomicPtr<std::sys::unix::locks::pthread_mutex::Mutex>" }
%"core::marker::PhantomData<std::sys::unix::locks::pthread_mutex::Mutex>" = type {}
%"core::sync::atomic::AtomicPtr<std::sys::unix::locks::pthread_mutex::Mutex>" = type { i64* }
%"std::sys::unix::locks::pthread_mutex::Mutex" = type { %"core::cell::UnsafeCell<libc::unix::bsd::apple::pthread_mutex_t>" }
%"core::cell::UnsafeCell<libc::unix::bsd::apple::pthread_mutex_t>" = type { %"libc::unix::bsd::apple::pthread_mutex_t" }
%"libc::unix::bsd::apple::pthread_mutex_t" = type { i64, [56 x i8] }
%"core::result::Result<std::sync::mutex::MutexGuard<i32>, std::sync::poison::PoisonError<std::sync::mutex::MutexGuard<i32>>>" = type { i64, [2 x i64] }
%"std::sync::mutex::Mutex<i32>" = type { %"std::sys_common::mutex::MovableMutex", %"std::sync::poison::Flag", [3 x i8], i32 }
%"std::sync::poison::Flag" = type { %"core::sync::atomic::AtomicBool" }
%"core::sync::atomic::AtomicBool" = type { i8 }
%"core::result::Result<std::sync::mutex::MutexGuard<i32>, std::sync::poison::PoisonError<std::sync::mutex::MutexGuard<i32>>>::Err" = type { [1 x i64], { i64*, i8 } }
%"core::result::Result<std::sync::mutex::MutexGuard<i32>, std::sync::poison::PoisonError<std::sync::mutex::MutexGuard<i32>>>::Ok" = type { [1 x i64], { i64*, i8 } }
%"core::fmt::Arguments" = type { { [0 x { [0 x i8]*, i64 }]*, i64 }, { i64*, i64 }, { [0 x { i8*, i64* }]*, i64 } }
%"core::panic::location::Location" = type { { [0 x i8]*, i64 }, i32, i32 }
%"alloc::alloc::Global" = type {}
%"core::mem::maybe_uninit::MaybeUninit<alloc::alloc::Global>" = type { [0 x i8] }
%"core::ptr::metadata::PtrComponents<u8>" = type { {}*, {} }
%"core::ptr::metadata::PtrRepr<u8>" = type { [1 x i64] }
%"core::ptr::metadata::PtrComponents<std::sys::unix::locks::pthread_mutex::Mutex>" = type { {}*, {} }
%"core::ptr::metadata::PtrRepr<std::sys::unix::locks::pthread_mutex::Mutex>" = type { [1 x i64] }
%"core::fmt::Formatter" = type { { i64, i64 }, { i64, i64 }, { {}*, [3 x i64]* }, i32, i32, i8, [7 x i8] }
%"core::fmt::builders::DebugStruct" = type { %"core::fmt::Formatter"*, i8, i8, [6 x i8] }
%"unwind::libunwind::_Unwind_Exception" = type { i64, void (i32, %"unwind::libunwind::_Unwind_Exception"*)*, [2 x i64] }
%"unwind::libunwind::_Unwind_Context" = type { [0 x i8] }

@_ZN3std9panicking11panic_count18GLOBAL_PANIC_COUNT17h2b64f86644a1a3eeE = external global %"core::sync::atomic::AtomicUsize"
@alloc38 = private unnamed_addr constant <{ [12 x i8] }> <{ [12 x i8] c"invalid args" }>, align 1
@alloc39 = private unnamed_addr constant <{ i8*, [8 x i8] }> <{ i8* getelementptr inbounds (<{ [12 x i8] }>, <{ [12 x i8] }>* @alloc38, i32 0, i32 0, i32 0), [8 x i8] c"\0C\00\00\00\00\00\00\00" }>, align 8
@alloc56 = private unnamed_addr constant <{}> zeroinitializer, align 8
@alloc154 = private unnamed_addr constant <{ [75 x i8] }> <{ [75 x i8] c"/rustc/4b91a6ea7258a947e59c6522cd5898e7c0a6a88f/library/core/src/fmt/mod.rs" }>, align 1
@alloc155 = private unnamed_addr constant <{ i8*, [16 x i8] }> <{ i8* getelementptr inbounds (<{ [75 x i8] }>, <{ [75 x i8] }>* @alloc154, i32 0, i32 0, i32 0), [16 x i8] c"K\00\00\00\00\00\00\00\87\01\00\00\0D\00\00\00" }>, align 8
@alloc156 = private unnamed_addr constant <{ [75 x i8] }> <{ [75 x i8] c"/rustc/4b91a6ea7258a947e59c6522cd5898e7c0a6a88f/library/core/src/ptr/mod.rs" }>, align 1
@alloc157 = private unnamed_addr constant <{ i8*, [16 x i8] }> <{ i8* getelementptr inbounds (<{ [75 x i8] }>, <{ [75 x i8] }>* @alloc156, i32 0, i32 0, i32 0), [16 x i8] c"K\00\00\00\00\00\00\00\80\04\00\00\0D\00\00\00" }>, align 8
@alloc28 = private unnamed_addr constant <{ [49 x i8] }> <{ [49 x i8] c"there is no such thing as an acquire/release load" }>, align 1
@alloc29 = private unnamed_addr constant <{ i8*, [8 x i8] }> <{ i8* getelementptr inbounds (<{ [49 x i8] }>, <{ [49 x i8] }>* @alloc28, i32 0, i32 0, i32 0), [8 x i8] c"1\00\00\00\00\00\00\00" }>, align 8
@alloc187 = private unnamed_addr constant <{ [79 x i8] }> <{ [79 x i8] c"/rustc/4b91a6ea7258a947e59c6522cd5898e7c0a6a88f/library/core/src/sync/atomic.rs" }>, align 1
@alloc176 = private unnamed_addr constant <{ i8*, [16 x i8] }> <{ i8* getelementptr inbounds (<{ [79 x i8] }>, <{ [79 x i8] }>* @alloc187, i32 0, i32 0, i32 0), [16 x i8] c"O\00\00\00\00\00\00\00$\0A\00\00\17\00\00\00" }>, align 8
@alloc33 = private unnamed_addr constant <{ [40 x i8] }> <{ [40 x i8] c"there is no such thing as a release load" }>, align 1
@alloc34 = private unnamed_addr constant <{ i8*, [8 x i8] }> <{ i8* getelementptr inbounds (<{ [40 x i8] }>, <{ [40 x i8] }>* @alloc33, i32 0, i32 0, i32 0), [8 x i8] c"(\00\00\00\00\00\00\00" }>, align 8
@alloc178 = private unnamed_addr constant <{ i8*, [16 x i8] }> <{ i8* getelementptr inbounds (<{ [79 x i8] }>, <{ [79 x i8] }>* @alloc187, i32 0, i32 0, i32 0), [16 x i8] c"O\00\00\00\00\00\00\00#\0A\00\00\18\00\00\00" }>, align 8
@alloc81 = private unnamed_addr constant <{ [50 x i8] }> <{ [50 x i8] c"there is no such thing as an acquire/release store" }>, align 1
@alloc82 = private unnamed_addr constant <{ i8*, [8 x i8] }> <{ i8* getelementptr inbounds (<{ [50 x i8] }>, <{ [50 x i8] }>* @alloc81, i32 0, i32 0, i32 0), [8 x i8] c"2\00\00\00\00\00\00\00" }>, align 8
@alloc180 = private unnamed_addr constant <{ i8*, [16 x i8] }> <{ i8* getelementptr inbounds (<{ [79 x i8] }>, <{ [79 x i8] }>* @alloc187, i32 0, i32 0, i32 0), [16 x i8] c"O\00\00\00\00\00\00\00\16\0A\00\00\17\00\00\00" }>, align 8
@alloc86 = private unnamed_addr constant <{ [42 x i8] }> <{ [42 x i8] c"there is no such thing as an acquire store" }>, align 1
@alloc87 = private unnamed_addr constant <{ i8*, [8 x i8] }> <{ i8* getelementptr inbounds (<{ [42 x i8] }>, <{ [42 x i8] }>* @alloc86, i32 0, i32 0, i32 0), [8 x i8] c"*\00\00\00\00\00\00\00" }>, align 8
@alloc182 = private unnamed_addr constant <{ i8*, [16 x i8] }> <{ i8* getelementptr inbounds (<{ [79 x i8] }>, <{ [79 x i8] }>* @alloc187, i32 0, i32 0, i32 0), [16 x i8] c"O\00\00\00\00\00\00\00\15\0A\00\00\18\00\00\00" }>, align 8
@alloc43 = private unnamed_addr constant <{ [60 x i8] }> <{ [60 x i8] c"a failure ordering can't be stronger than a success ordering" }>, align 1
@alloc44 = private unnamed_addr constant <{ i8*, [8 x i8] }> <{ i8* getelementptr inbounds (<{ [60 x i8] }>, <{ [60 x i8] }>* @alloc43, i32 0, i32 0, i32 0), [8 x i8] c"<\00\00\00\00\00\00\00" }>, align 8
@alloc184 = private unnamed_addr constant <{ i8*, [16 x i8] }> <{ i8* getelementptr inbounds (<{ [79 x i8] }>, <{ [79 x i8] }>* @alloc187, i32 0, i32 0, i32 0), [16 x i8] c"O\00\00\00\00\00\00\00o\0A\00\00\12\00\00\00" }>, align 8
@alloc48 = private unnamed_addr constant <{ [61 x i8] }> <{ [61 x i8] c"there is no such thing as an acquire/release failure ordering" }>, align 1
@alloc49 = private unnamed_addr constant <{ i8*, [8 x i8] }> <{ i8* getelementptr inbounds (<{ [61 x i8] }>, <{ [61 x i8] }>* @alloc48, i32 0, i32 0, i32 0), [8 x i8] c"=\00\00\00\00\00\00\00" }>, align 8
@alloc186 = private unnamed_addr constant <{ i8*, [16 x i8] }> <{ i8* getelementptr inbounds (<{ [79 x i8] }>, <{ [79 x i8] }>* @alloc187, i32 0, i32 0, i32 0), [16 x i8] c"O\00\00\00\00\00\00\00m\0A\00\00\1C\00\00\00" }>, align 8
@alloc53 = private unnamed_addr constant <{ [52 x i8] }> <{ [52 x i8] c"there is no such thing as a release failure ordering" }>, align 1
@alloc54 = private unnamed_addr constant <{ i8*, [8 x i8] }> <{ i8* getelementptr inbounds (<{ [52 x i8] }>, <{ [52 x i8] }>* @alloc53, i32 0, i32 0, i32 0), [8 x i8] c"4\00\00\00\00\00\00\00" }>, align 8
@alloc188 = private unnamed_addr constant <{ i8*, [16 x i8] }> <{ i8* getelementptr inbounds (<{ [79 x i8] }>, <{ [79 x i8] }>* @alloc187, i32 0, i32 0, i32 0), [16 x i8] c"O\00\00\00\00\00\00\00n\0A\00\00\1D\00\00\00" }>, align 8
@alloc189 = private unnamed_addr constant <{ [43 x i8] }> <{ [43 x i8] c"called `Result::unwrap()` on an `Err` value" }>, align 1
@vtable.0 = private unnamed_addr constant <{ i8*, [16 x i8], i8* }> <{ i8* bitcast (void ({ i64*, i8 }*)* @"_ZN4core3ptr98drop_in_place$LT$std..sync..poison..PoisonError$LT$std..sync..mutex..MutexGuard$LT$i32$GT$$GT$$GT$17h3b12ccb00e013112E" to i8*), [16 x i8] c"\10\00\00\00\00\00\00\00\08\00\00\00\00\00\00\00", i8* bitcast (i1 ({ i64*, i8 }*, %"core::fmt::Formatter"*)* @"_ZN76_$LT$std..sync..poison..PoisonError$LT$T$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h3ed8e3f089979757E" to i8*) }>, align 8
@alloc193 = private unnamed_addr constant <{ [11 x i8] }> <{ [11 x i8] c"PoisonError" }>, align 1
@alloc194 = private unnamed_addr constant <{ [6 x i8] }> <{ [6 x i8] c"<anon>" }>, align 1
@alloc195 = private unnamed_addr constant <{ i8*, [16 x i8] }> <{ i8* getelementptr inbounds (<{ [6 x i8] }>, <{ [6 x i8] }>* @alloc194, i32 0, i32 0, i32 0), [16 x i8] c"\06\00\00\00\00\00\00\00\04\00\00\00\16\00\00\00" }>, align 8
@_ZN6probe15probe8MY_MUTEX17h85724f22b3179500E = internal global <{ [9 x i8], [3 x i8], [4 x i8] }> <{ [9 x i8] zeroinitializer, [3 x i8] undef, [4 x i8] c"\01\00\00\00" }>, align 8

; <core::ptr::non_null::NonNull<T> as core::convert::From<core::ptr::unique::Unique<T>>>::from
; Function Attrs: inlinehint uwtable
define i8* @"_ZN119_$LT$core..ptr..non_null..NonNull$LT$T$GT$$u20$as$u20$core..convert..From$LT$core..ptr..unique..Unique$LT$T$GT$$GT$$GT$4from17h560f851b15f802e4E"(i8* %unique) unnamed_addr #0 {
start:
; call core::ptr::unique::Unique<T>::as_ptr
  %_2 = call i8* @"_ZN4core3ptr6unique15Unique$LT$T$GT$6as_ptr17hd9dbcab12a4828f4E"(i8* %unique)
  br label %bb1

bb1:                                              ; preds = %start
; call core::ptr::non_null::NonNull<T>::new_unchecked
  %0 = call i8* @"_ZN4core3ptr8non_null16NonNull$LT$T$GT$13new_unchecked17hbb5feb28f16b533fE"(i8* %_2)
  br label %bb2

bb2:                                              ; preds = %bb1
  ret i8* %0
}

; <core::ptr::unique::Unique<T> as core::convert::From<core::ptr::non_null::NonNull<T>>>::from
; Function Attrs: inlinehint uwtable
define i8* @"_ZN119_$LT$core..ptr..unique..Unique$LT$T$GT$$u20$as$u20$core..convert..From$LT$core..ptr..non_null..NonNull$LT$T$GT$$GT$$GT$4from17h04b01aa57467542eE"(i8* %pointer) unnamed_addr #0 {
start:
  %0 = alloca i8*, align 8
  store i8* %pointer, i8** %0, align 8
  %1 = load i8*, i8** %0, align 8, !nonnull !1, !noundef !1
  ret i8* %1
}

; <core::ptr::unique::Unique<T> as core::convert::From<core::ptr::non_null::NonNull<T>>>::from
; Function Attrs: inlinehint uwtable
define i64* @"_ZN119_$LT$core..ptr..unique..Unique$LT$T$GT$$u20$as$u20$core..convert..From$LT$core..ptr..non_null..NonNull$LT$T$GT$$GT$$GT$4from17h3c047d7c54aa1829E"(i64* %pointer) unnamed_addr #0 {
start:
  %0 = alloca i64*, align 8
  store i64* %pointer, i64** %0, align 8
  %1 = load i64*, i64** %0, align 8, !nonnull !1, !noundef !1
  ret i64* %1
}

; std::sys_common::mutex::MovableMutex::raw_unlock
; Function Attrs: inlinehint uwtable
define internal void @_ZN3std10sys_common5mutex12MovableMutex10raw_unlock17h6fd23d8c745e3a52E(%"std::sys_common::mutex::MovableMutex"* align 8 %self) unnamed_addr #0 {
start:
  %_4 = bitcast %"std::sys_common::mutex::MovableMutex"* %self to %"std::sys_common::lazy_box::LazyBox<std::sys::unix::locks::pthread_mutex::Mutex>"*
; call <std::sys_common::lazy_box::LazyBox<T> as core::ops::deref::Deref>::deref
  %_3 = call align 8 %"std::sys::unix::locks::pthread_mutex::Mutex"* @"_ZN87_$LT$std..sys_common..lazy_box..LazyBox$LT$T$GT$$u20$as$u20$core..ops..deref..Deref$GT$5deref17hd9449bbbda440220E"(%"std::sys_common::lazy_box::LazyBox<std::sys::unix::locks::pthread_mutex::Mutex>"* align 8 %_4)
  br label %bb1

bb1:                                              ; preds = %start
; call std::sys::unix::locks::pthread_mutex::Mutex::unlock
  call void @_ZN3std3sys4unix5locks13pthread_mutex5Mutex6unlock17hc40e73e362b01b65E(%"std::sys::unix::locks::pthread_mutex::Mutex"* align 8 %_3)
  br label %bb2

bb2:                                              ; preds = %bb1
  ret void
}

; std::sys_common::mutex::MovableMutex::raw_lock
; Function Attrs: inlinehint uwtable
define internal void @_ZN3std10sys_common5mutex12MovableMutex8raw_lock17h1dafff1ba98065c7E(%"std::sys_common::mutex::MovableMutex"* align 8 %self) unnamed_addr #0 {
start:
  %_4 = bitcast %"std::sys_common::mutex::MovableMutex"* %self to %"std::sys_common::lazy_box::LazyBox<std::sys::unix::locks::pthread_mutex::Mutex>"*
; call <std::sys_common::lazy_box::LazyBox<T> as core::ops::deref::Deref>::deref
  %_3 = call align 8 %"std::sys::unix::locks::pthread_mutex::Mutex"* @"_ZN87_$LT$std..sys_common..lazy_box..LazyBox$LT$T$GT$$u20$as$u20$core..ops..deref..Deref$GT$5deref17hd9449bbbda440220E"(%"std::sys_common::lazy_box::LazyBox<std::sys::unix::locks::pthread_mutex::Mutex>"* align 8 %_4)
  br label %bb1

bb1:                                              ; preds = %start
; call std::sys::unix::locks::pthread_mutex::Mutex::lock
  call void @_ZN3std3sys4unix5locks13pthread_mutex5Mutex4lock17h286adb2498c47366E(%"std::sys::unix::locks::pthread_mutex::Mutex"* align 8 %_3)
  br label %bb2

bb2:                                              ; preds = %bb1
  ret void
}

; std::sys_common::lazy_box::LazyBox<T>::initialize
; Function Attrs: cold uwtable
define %"std::sys::unix::locks::pthread_mutex::Mutex"* @"_ZN3std10sys_common8lazy_box16LazyBox$LT$T$GT$10initialize17h82d7c85177e6b581E"(%"std::sys_common::lazy_box::LazyBox<std::sys::unix::locks::pthread_mutex::Mutex>"* align 8 %self) unnamed_addr #1 {
start:
  %0 = alloca {}*, align 8
  %_9 = alloca i8, align 1
  %_8 = alloca i8, align 1
  %_4 = alloca { i64, i8* }, align 8
  %1 = alloca %"std::sys::unix::locks::pthread_mutex::Mutex"*, align 8
; call <std::sys::unix::locks::pthread_mutex::Mutex as std::sys_common::lazy_box::LazyInit>::init
  %_3 = call align 8 %"std::sys::unix::locks::pthread_mutex::Mutex"* @"_ZN99_$LT$std..sys..unix..locks..pthread_mutex..Mutex$u20$as$u20$std..sys_common..lazy_box..LazyInit$GT$4init17h803c2be3b9ea0a70E"()
  br label %bb1

bb1:                                              ; preds = %start
; call alloc::boxed::Box<T,A>::into_raw
  %new_ptr = call %"std::sys::unix::locks::pthread_mutex::Mutex"* @"_ZN5alloc5boxed16Box$LT$T$C$A$GT$8into_raw17h912f843723cfd842E"(%"std::sys::unix::locks::pthread_mutex::Mutex"* align 8 %_3)
  br label %bb2

bb2:                                              ; preds = %bb1
  %_5 = bitcast %"std::sys_common::lazy_box::LazyBox<std::sys::unix::locks::pthread_mutex::Mutex>"* %self to %"core::sync::atomic::AtomicPtr<std::sys::unix::locks::pthread_mutex::Mutex>"*
  %2 = bitcast {}** %0 to i64*
  store i64 0, i64* %2, align 8
  %3 = load {}*, {}** %0, align 8
; call core::ptr::metadata::from_raw_parts_mut
  %4 = call %"std::sys::unix::locks::pthread_mutex::Mutex"* @_ZN4core3ptr8metadata18from_raw_parts_mut17hed9aa0e0c0f4e3dfE({}* %3)
  br label %bb3

bb3:                                              ; preds = %bb2
  store i8 3, i8* %_8, align 1
  store i8 2, i8* %_9, align 1
  %5 = load i8, i8* %_8, align 1, !range !2, !noundef !1
  %6 = load i8, i8* %_9, align 1, !range !2, !noundef !1
; call core::sync::atomic::AtomicPtr<T>::compare_exchange
  %7 = call { i64, i8* } @"_ZN4core4sync6atomic18AtomicPtr$LT$T$GT$16compare_exchange17h06337a85f292b96fE"(%"core::sync::atomic::AtomicPtr<std::sys::unix::locks::pthread_mutex::Mutex>"* align 8 %_5, %"std::sys::unix::locks::pthread_mutex::Mutex"* %4, %"std::sys::unix::locks::pthread_mutex::Mutex"* %new_ptr, i8 %5, i8 %6)
  store { i64, i8* } %7, { i64, i8* }* %_4, align 8
  br label %bb4

bb4:                                              ; preds = %bb3
  %8 = bitcast { i64, i8* }* %_4 to i64*
  %_10 = load i64, i64* %8, align 8, !range !3, !noundef !1
  switch i64 %_10, label %bb6 [
    i64 0, label %bb7
    i64 1, label %bb5
  ]

bb6:                                              ; preds = %bb4
  unreachable

bb7:                                              ; preds = %bb4
  store %"std::sys::unix::locks::pthread_mutex::Mutex"* %new_ptr, %"std::sys::unix::locks::pthread_mutex::Mutex"** %1, align 8
  br label %bb10

bb5:                                              ; preds = %bb4
  %9 = getelementptr inbounds { i64, i8* }, { i64, i8* }* %_4, i32 0, i32 1
  %10 = bitcast i8** %9 to %"std::sys::unix::locks::pthread_mutex::Mutex"**
  %ptr = load %"std::sys::unix::locks::pthread_mutex::Mutex"*, %"std::sys::unix::locks::pthread_mutex::Mutex"** %10, align 8
; call alloc::boxed::Box<T>::from_raw
  %_13 = call align 8 %"std::sys::unix::locks::pthread_mutex::Mutex"* @"_ZN5alloc5boxed12Box$LT$T$GT$8from_raw17h9016c750bf2f2bbdE"(%"std::sys::unix::locks::pthread_mutex::Mutex"* %new_ptr)
  br label %bb8

bb8:                                              ; preds = %bb5
; call core::mem::drop
  call void @_ZN4core3mem4drop17hb6b217fed38f815aE(%"std::sys::unix::locks::pthread_mutex::Mutex"* align 8 %_13)
  br label %bb9

bb9:                                              ; preds = %bb8
  store %"std::sys::unix::locks::pthread_mutex::Mutex"* %ptr, %"std::sys::unix::locks::pthread_mutex::Mutex"** %1, align 8
  br label %bb10

bb10:                                             ; preds = %bb7, %bb9
  %11 = load %"std::sys::unix::locks::pthread_mutex::Mutex"*, %"std::sys::unix::locks::pthread_mutex::Mutex"** %1, align 8
  ret %"std::sys::unix::locks::pthread_mutex::Mutex"* %11
}

; std::sys_common::lazy_box::LazyBox<T>::get_pointer
; Function Attrs: inlinehint uwtable
define %"std::sys::unix::locks::pthread_mutex::Mutex"* @"_ZN3std10sys_common8lazy_box16LazyBox$LT$T$GT$11get_pointer17h7f0eb711b80b7651E"(%"std::sys_common::lazy_box::LazyBox<std::sys::unix::locks::pthread_mutex::Mutex>"* align 8 %self) unnamed_addr #0 {
start:
  %_4 = alloca i8, align 1
  %0 = alloca %"std::sys::unix::locks::pthread_mutex::Mutex"*, align 8
  %_3 = bitcast %"std::sys_common::lazy_box::LazyBox<std::sys::unix::locks::pthread_mutex::Mutex>"* %self to %"core::sync::atomic::AtomicPtr<std::sys::unix::locks::pthread_mutex::Mutex>"*
  store i8 2, i8* %_4, align 1
  %1 = load i8, i8* %_4, align 1, !range !2, !noundef !1
; call core::sync::atomic::AtomicPtr<T>::load
  %ptr = call %"std::sys::unix::locks::pthread_mutex::Mutex"* @"_ZN4core4sync6atomic18AtomicPtr$LT$T$GT$4load17h4bff9461efd5f8a4E"(%"core::sync::atomic::AtomicPtr<std::sys::unix::locks::pthread_mutex::Mutex>"* align 8 %_3, i8 %1)
  br label %bb1

bb1:                                              ; preds = %start
; call core::ptr::mut_ptr::<impl *mut T>::is_null
  %_5 = call zeroext i1 @"_ZN4core3ptr7mut_ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$7is_null17h712b26941d61c13aE"(%"std::sys::unix::locks::pthread_mutex::Mutex"* %ptr)
  br label %bb2

bb2:                                              ; preds = %bb1
  br i1 %_5, label %bb3, label %bb5

bb5:                                              ; preds = %bb2
  store %"std::sys::unix::locks::pthread_mutex::Mutex"* %ptr, %"std::sys::unix::locks::pthread_mutex::Mutex"** %0, align 8
  br label %bb6

bb3:                                              ; preds = %bb2
; call std::sys_common::lazy_box::LazyBox<T>::initialize
  %2 = call %"std::sys::unix::locks::pthread_mutex::Mutex"* @"_ZN3std10sys_common8lazy_box16LazyBox$LT$T$GT$10initialize17h82d7c85177e6b581E"(%"std::sys_common::lazy_box::LazyBox<std::sys::unix::locks::pthread_mutex::Mutex>"* align 8 %self)
  store %"std::sys::unix::locks::pthread_mutex::Mutex"* %2, %"std::sys::unix::locks::pthread_mutex::Mutex"** %0, align 8
  br label %bb4

bb4:                                              ; preds = %bb3
  br label %bb6

bb6:                                              ; preds = %bb5, %bb4
  %3 = load %"std::sys::unix::locks::pthread_mutex::Mutex"*, %"std::sys::unix::locks::pthread_mutex::Mutex"** %0, align 8
  ret %"std::sys::unix::locks::pthread_mutex::Mutex"* %3
}

; std::sys::unix::locks::pthread_mutex::Mutex::lock
; Function Attrs: inlinehint uwtable
define internal void @_ZN3std3sys4unix5locks13pthread_mutex5Mutex4lock17h286adb2498c47366E(%"std::sys::unix::locks::pthread_mutex::Mutex"* align 8 %self) unnamed_addr #0 {
start:
  %_4 = bitcast %"std::sys::unix::locks::pthread_mutex::Mutex"* %self to %"core::cell::UnsafeCell<libc::unix::bsd::apple::pthread_mutex_t>"*
  %_2.i = bitcast %"core::cell::UnsafeCell<libc::unix::bsd::apple::pthread_mutex_t>"* %_4 to %"libc::unix::bsd::apple::pthread_mutex_t"*
  br label %bb1

bb1:                                              ; preds = %start
  %r = call i32 @pthread_mutex_lock(%"libc::unix::bsd::apple::pthread_mutex_t"* %_2.i)
  br label %bb2

bb2:                                              ; preds = %bb1
  ret void
}

; std::sys::unix::locks::pthread_mutex::Mutex::unlock
; Function Attrs: inlinehint uwtable
define internal void @_ZN3std3sys4unix5locks13pthread_mutex5Mutex6unlock17hc40e73e362b01b65E(%"std::sys::unix::locks::pthread_mutex::Mutex"* align 8 %self) unnamed_addr #0 {
start:
  %_4 = bitcast %"std::sys::unix::locks::pthread_mutex::Mutex"* %self to %"core::cell::UnsafeCell<libc::unix::bsd::apple::pthread_mutex_t>"*
  %_2.i = bitcast %"core::cell::UnsafeCell<libc::unix::bsd::apple::pthread_mutex_t>"* %_4 to %"libc::unix::bsd::apple::pthread_mutex_t"*
  br label %bb1

bb1:                                              ; preds = %start
  %r = call i32 @pthread_mutex_unlock(%"libc::unix::bsd::apple::pthread_mutex_t"* %_2.i)
  br label %bb2

bb2:                                              ; preds = %bb1
  ret void
}

; std::sys::unix::locks::pthread_mutex::Mutex::destroy
; Function Attrs: inlinehint uwtable
define internal void @_ZN3std3sys4unix5locks13pthread_mutex5Mutex7destroy17h35e1c8f63f793101E(%"std::sys::unix::locks::pthread_mutex::Mutex"* align 8 %self) unnamed_addr #0 {
start:
  %_4 = bitcast %"std::sys::unix::locks::pthread_mutex::Mutex"* %self to %"core::cell::UnsafeCell<libc::unix::bsd::apple::pthread_mutex_t>"*
  %_2.i = bitcast %"core::cell::UnsafeCell<libc::unix::bsd::apple::pthread_mutex_t>"* %_4 to %"libc::unix::bsd::apple::pthread_mutex_t"*
  br label %bb1

bb1:                                              ; preds = %start
  %r = call i32 @pthread_mutex_destroy(%"libc::unix::bsd::apple::pthread_mutex_t"* %_2.i)
  br label %bb2

bb2:                                              ; preds = %bb1
  ret void
}

; std::sync::mutex::Mutex<T>::lock
; Function Attrs: uwtable
define void @"_ZN3std4sync5mutex14Mutex$LT$T$GT$4lock17heb9f1d8b8be095fdE"(%"core::result::Result<std::sync::mutex::MutexGuard<i32>, std::sync::poison::PoisonError<std::sync::mutex::MutexGuard<i32>>>"* sret(%"core::result::Result<std::sync::mutex::MutexGuard<i32>, std::sync::poison::PoisonError<std::sync::mutex::MutexGuard<i32>>>") %0, %"std::sync::mutex::Mutex<i32>"* align 8 %self) unnamed_addr #2 {
start:
  %_3 = bitcast %"std::sync::mutex::Mutex<i32>"* %self to %"std::sys_common::mutex::MovableMutex"*
; call std::sys_common::mutex::MovableMutex::raw_lock
  call void @_ZN3std10sys_common5mutex12MovableMutex8raw_lock17h1dafff1ba98065c7E(%"std::sys_common::mutex::MovableMutex"* align 8 %_3)
  br label %bb1

bb1:                                              ; preds = %start
; call std::sync::mutex::MutexGuard<T>::new
  call void @"_ZN3std4sync5mutex19MutexGuard$LT$T$GT$3new17hdd77dc4adc11695dE"(%"core::result::Result<std::sync::mutex::MutexGuard<i32>, std::sync::poison::PoisonError<std::sync::mutex::MutexGuard<i32>>>"* sret(%"core::result::Result<std::sync::mutex::MutexGuard<i32>, std::sync::poison::PoisonError<std::sync::mutex::MutexGuard<i32>>>") %0, %"std::sync::mutex::Mutex<i32>"* align 8 %self)
  br label %bb2

bb2:                                              ; preds = %bb1
  ret void
}

; std::sync::mutex::MutexGuard<T>::new
; Function Attrs: uwtable
define void @"_ZN3std4sync5mutex19MutexGuard$LT$T$GT$3new17hdd77dc4adc11695dE"(%"core::result::Result<std::sync::mutex::MutexGuard<i32>, std::sync::poison::PoisonError<std::sync::mutex::MutexGuard<i32>>>"* sret(%"core::result::Result<std::sync::mutex::MutexGuard<i32>, std::sync::poison::PoisonError<std::sync::mutex::MutexGuard<i32>>>") %0, %"std::sync::mutex::Mutex<i32>"* align 8 %lock) unnamed_addr #2 {
start:
  %_4 = alloca i64*, align 8
  %_3 = getelementptr inbounds %"std::sync::mutex::Mutex<i32>", %"std::sync::mutex::Mutex<i32>"* %lock, i32 0, i32 1
; call std::sync::poison::Flag::guard
  %1 = call { i8, i8 } @_ZN3std4sync6poison4Flag5guard17h347590fd9b46f56aE(%"std::sync::poison::Flag"* align 1 %_3)
  %2 = extractvalue { i8, i8 } %1, 0
  %_2.0 = trunc i8 %2 to i1
  %_2.1 = extractvalue { i8, i8 } %1, 1
  br label %bb1

bb1:                                              ; preds = %start
  %3 = bitcast i64** %_4 to %"std::sync::mutex::Mutex<i32>"**
  store %"std::sync::mutex::Mutex<i32>"* %lock, %"std::sync::mutex::Mutex<i32>"** %3, align 8
  %4 = load i64*, i64** %_4, align 8, !nonnull !1, !align !4, !noundef !1
; call std::sync::poison::map_result
  call void @_ZN3std4sync6poison10map_result17h85b026e0fdda1081E(%"core::result::Result<std::sync::mutex::MutexGuard<i32>, std::sync::poison::PoisonError<std::sync::mutex::MutexGuard<i32>>>"* sret(%"core::result::Result<std::sync::mutex::MutexGuard<i32>, std::sync::poison::PoisonError<std::sync::mutex::MutexGuard<i32>>>") %0, i1 zeroext %_2.0, i8 %_2.1, i64* align 8 %4)
  br label %bb2

bb2:                                              ; preds = %bb1
  ret void
}

; std::sync::mutex::MutexGuard<T>::new::{{closure}}
; Function Attrs: inlinehint uwtable
define { i64*, i8 } @"_ZN3std4sync5mutex19MutexGuard$LT$T$GT$3new28_$u7b$$u7b$closure$u7d$$u7d$17hbf0042d1f556b928E"(i64* align 8 %_1, i1 zeroext %guard) unnamed_addr #0 {
start:
  %0 = alloca { i64*, i8 }, align 8
  %_5 = bitcast i64* %_1 to %"std::sync::mutex::Mutex<i32>"*
  %1 = bitcast { i64*, i8 }* %0 to %"std::sync::mutex::Mutex<i32>"**
  store %"std::sync::mutex::Mutex<i32>"* %_5, %"std::sync::mutex::Mutex<i32>"** %1, align 8
  %2 = getelementptr inbounds { i64*, i8 }, { i64*, i8 }* %0, i32 0, i32 1
  %3 = zext i1 %guard to i8
  store i8 %3, i8* %2, align 8
  %4 = getelementptr inbounds { i64*, i8 }, { i64*, i8 }* %0, i32 0, i32 0
  %5 = load i64*, i64** %4, align 8, !nonnull !1, !align !4, !noundef !1
  %6 = getelementptr inbounds { i64*, i8 }, { i64*, i8 }* %0, i32 0, i32 1
  %7 = load i8, i8* %6, align 8, !range !5, !noundef !1
  %8 = trunc i8 %7 to i1
  %9 = zext i1 %8 to i8
  %10 = insertvalue { i64*, i8 } undef, i64* %5, 0
  %11 = insertvalue { i64*, i8 } %10, i8 %9, 1
  ret { i64*, i8 } %11
}

; std::sync::poison::map_result
; Function Attrs: uwtable
define void @_ZN3std4sync6poison10map_result17h85b026e0fdda1081E(%"core::result::Result<std::sync::mutex::MutexGuard<i32>, std::sync::poison::PoisonError<std::sync::mutex::MutexGuard<i32>>>"* sret(%"core::result::Result<std::sync::mutex::MutexGuard<i32>, std::sync::poison::PoisonError<std::sync::mutex::MutexGuard<i32>>>") %0, i1 zeroext %1, i8 %2, i64* align 8 %f) unnamed_addr #2 {
start:
  %_13 = alloca i8, align 1
  %_7 = alloca i8, align 1
  %result = alloca { i8, i8 }, align 1
  %3 = getelementptr inbounds { i8, i8 }, { i8, i8 }* %result, i32 0, i32 0
  %4 = zext i1 %1 to i8
  store i8 %4, i8* %3, align 1
  %5 = getelementptr inbounds { i8, i8 }, { i8, i8 }* %result, i32 0, i32 1
  store i8 %2, i8* %5, align 1
  %6 = bitcast { i8, i8 }* %result to i8*
  %7 = load i8, i8* %6, align 1, !range !5, !noundef !1
  %8 = trunc i8 %7 to i1
  %_3 = zext i1 %8 to i64
  switch i64 %_3, label %bb2 [
    i64 0, label %bb3
    i64 1, label %bb1
  ]

bb2:                                              ; preds = %start
  unreachable

bb3:                                              ; preds = %start
  %9 = getelementptr inbounds { i8, i8 }, { i8, i8 }* %result, i32 0, i32 1
  %10 = load i8, i8* %9, align 1, !range !5, !noundef !1
  %t = trunc i8 %10 to i1
  %11 = zext i1 %t to i8
  store i8 %11, i8* %_7, align 1
  %12 = load i8, i8* %_7, align 1, !range !5, !noundef !1
  %13 = trunc i8 %12 to i1
; call std::sync::mutex::MutexGuard<T>::new::{{closure}}
  %14 = call { i64*, i8 } @"_ZN3std4sync5mutex19MutexGuard$LT$T$GT$3new28_$u7b$$u7b$closure$u7d$$u7d$17hbf0042d1f556b928E"(i64* align 8 %f, i1 zeroext %13)
  %_5.0 = extractvalue { i64*, i8 } %14, 0
  %15 = extractvalue { i64*, i8 } %14, 1
  %_5.1 = trunc i8 %15 to i1
  br label %bb4

bb1:                                              ; preds = %start
  %16 = getelementptr inbounds { i8, i8 }, { i8, i8 }* %result, i32 0, i32 1
  %17 = load i8, i8* %16, align 1, !range !5, !noundef !1
  %guard = trunc i8 %17 to i1
  %18 = zext i1 %guard to i8
  store i8 %18, i8* %_13, align 1
  %19 = load i8, i8* %_13, align 1, !range !5, !noundef !1
  %20 = trunc i8 %19 to i1
; call std::sync::mutex::MutexGuard<T>::new::{{closure}}
  %21 = call { i64*, i8 } @"_ZN3std4sync5mutex19MutexGuard$LT$T$GT$3new28_$u7b$$u7b$closure$u7d$$u7d$17hbf0042d1f556b928E"(i64* align 8 %f, i1 zeroext %20)
  %_11.0 = extractvalue { i64*, i8 } %21, 0
  %22 = extractvalue { i64*, i8 } %21, 1
  %_11.1 = trunc i8 %22 to i1
  br label %bb5

bb5:                                              ; preds = %bb1
; call std::sync::poison::PoisonError<T>::new
  %23 = call { i64*, i8 } @"_ZN3std4sync6poison20PoisonError$LT$T$GT$3new17hbfd5019f84927819E"(i64* align 8 %_11.0, i1 zeroext %_11.1)
  %_10.0 = extractvalue { i64*, i8 } %23, 0
  %24 = extractvalue { i64*, i8 } %23, 1
  %_10.1 = trunc i8 %24 to i1
  br label %bb6

bb6:                                              ; preds = %bb5
  %25 = bitcast %"core::result::Result<std::sync::mutex::MutexGuard<i32>, std::sync::poison::PoisonError<std::sync::mutex::MutexGuard<i32>>>"* %0 to %"core::result::Result<std::sync::mutex::MutexGuard<i32>, std::sync::poison::PoisonError<std::sync::mutex::MutexGuard<i32>>>::Err"*
  %26 = getelementptr inbounds %"core::result::Result<std::sync::mutex::MutexGuard<i32>, std::sync::poison::PoisonError<std::sync::mutex::MutexGuard<i32>>>::Err", %"core::result::Result<std::sync::mutex::MutexGuard<i32>, std::sync::poison::PoisonError<std::sync::mutex::MutexGuard<i32>>>::Err"* %25, i32 0, i32 1
  %27 = getelementptr inbounds { i64*, i8 }, { i64*, i8 }* %26, i32 0, i32 0
  store i64* %_10.0, i64** %27, align 8
  %28 = getelementptr inbounds { i64*, i8 }, { i64*, i8 }* %26, i32 0, i32 1
  %29 = zext i1 %_10.1 to i8
  store i8 %29, i8* %28, align 8
  %30 = bitcast %"core::result::Result<std::sync::mutex::MutexGuard<i32>, std::sync::poison::PoisonError<std::sync::mutex::MutexGuard<i32>>>"* %0 to i64*
  store i64 1, i64* %30, align 8
  br label %bb7

bb7:                                              ; preds = %bb4, %bb6
  ret void

bb4:                                              ; preds = %bb3
  %31 = bitcast %"core::result::Result<std::sync::mutex::MutexGuard<i32>, std::sync::poison::PoisonError<std::sync::mutex::MutexGuard<i32>>>"* %0 to %"core::result::Result<std::sync::mutex::MutexGuard<i32>, std::sync::poison::PoisonError<std::sync::mutex::MutexGuard<i32>>>::Ok"*
  %32 = getelementptr inbounds %"core::result::Result<std::sync::mutex::MutexGuard<i32>, std::sync::poison::PoisonError<std::sync::mutex::MutexGuard<i32>>>::Ok", %"core::result::Result<std::sync::mutex::MutexGuard<i32>, std::sync::poison::PoisonError<std::sync::mutex::MutexGuard<i32>>>::Ok"* %31, i32 0, i32 1
  %33 = getelementptr inbounds { i64*, i8 }, { i64*, i8 }* %32, i32 0, i32 0
  store i64* %_5.0, i64** %33, align 8
  %34 = getelementptr inbounds { i64*, i8 }, { i64*, i8 }* %32, i32 0, i32 1
  %35 = zext i1 %_5.1 to i8
  store i8 %35, i8* %34, align 8
  %36 = bitcast %"core::result::Result<std::sync::mutex::MutexGuard<i32>, std::sync::poison::PoisonError<std::sync::mutex::MutexGuard<i32>>>"* %0 to i64*
  store i64 0, i64* %36, align 8
  br label %bb7
}

; std::sync::poison::PoisonError<T>::new
; Function Attrs: uwtable
define zeroext i1 @"_ZN3std4sync6poison20PoisonError$LT$T$GT$3new17h84b5728872323ef3E"(i1 zeroext %guard) unnamed_addr #2 {
start:
  %0 = alloca i8, align 1
  %1 = zext i1 %guard to i8
  store i8 %1, i8* %0, align 1
  %2 = load i8, i8* %0, align 1, !range !5, !noundef !1
  %3 = trunc i8 %2 to i1
  ret i1 %3
}

; std::sync::poison::PoisonError<T>::new
; Function Attrs: uwtable
define { i64*, i8 } @"_ZN3std4sync6poison20PoisonError$LT$T$GT$3new17hbfd5019f84927819E"(i64* align 8 %guard.0, i1 zeroext %guard.1) unnamed_addr #2 {
start:
  %0 = alloca { i64*, i8 }, align 8
  %1 = getelementptr inbounds { i64*, i8 }, { i64*, i8 }* %0, i32 0, i32 0
  store i64* %guard.0, i64** %1, align 8
  %2 = getelementptr inbounds { i64*, i8 }, { i64*, i8 }* %0, i32 0, i32 1
  %3 = zext i1 %guard.1 to i8
  store i8 %3, i8* %2, align 8
  %4 = getelementptr inbounds { i64*, i8 }, { i64*, i8 }* %0, i32 0, i32 0
  %5 = load i64*, i64** %4, align 8, !nonnull !1, !align !4, !noundef !1
  %6 = getelementptr inbounds { i64*, i8 }, { i64*, i8 }* %0, i32 0, i32 1
  %7 = load i8, i8* %6, align 8, !range !5, !noundef !1
  %8 = trunc i8 %7 to i1
  %9 = zext i1 %8 to i8
  %10 = insertvalue { i64*, i8 } undef, i64* %5, 0
  %11 = insertvalue { i64*, i8 } %10, i8 %9, 1
  ret { i64*, i8 } %11
}

; std::sync::poison::Flag::get
; Function Attrs: inlinehint uwtable
define internal zeroext i1 @_ZN3std4sync6poison4Flag3get17hb2d5942202adec41E(%"std::sync::poison::Flag"* align 1 %self) unnamed_addr #0 {
start:
  %_3 = alloca i8, align 1
  %_2 = bitcast %"std::sync::poison::Flag"* %self to %"core::sync::atomic::AtomicBool"*
  store i8 0, i8* %_3, align 1
  %0 = load i8, i8* %_3, align 1, !range !2, !noundef !1
; call core::sync::atomic::AtomicBool::load
  %1 = call zeroext i1 @_ZN4core4sync6atomic10AtomicBool4load17h754151d4647dff0dE(%"core::sync::atomic::AtomicBool"* align 1 %_2, i8 %0)
  br label %bb1

bb1:                                              ; preds = %start
  ret i1 %1
}

; std::sync::poison::Flag::done
; Function Attrs: inlinehint uwtable
define internal void @_ZN3std4sync6poison4Flag4done17h600127a8854403adE(%"std::sync::poison::Flag"* align 1 %self, i8* align 1 %guard) unnamed_addr #0 {
start:
  %_9 = alloca i8, align 1
  %_3 = alloca i8, align 1
  %0 = load i8, i8* %guard, align 1, !range !5, !noundef !1
  %_5 = trunc i8 %0 to i1
  %_4 = xor i1 %_5, true
  br i1 %_4, label %bb2, label %bb1

bb1:                                              ; preds = %start
  store i8 0, i8* %_3, align 1
  br label %bb3

bb2:                                              ; preds = %start
; call std::thread::panicking
  %_6 = call zeroext i1 @_ZN3std6thread9panicking17h7e73bd8d6d60a5cfE()
  br label %bb4

bb4:                                              ; preds = %bb2
  %1 = zext i1 %_6 to i8
  store i8 %1, i8* %_3, align 1
  br label %bb3

bb3:                                              ; preds = %bb1, %bb4
  %2 = load i8, i8* %_3, align 1, !range !5, !noundef !1
  %3 = trunc i8 %2 to i1
  br i1 %3, label %bb5, label %bb7

bb7:                                              ; preds = %bb6, %bb3
  ret void

bb5:                                              ; preds = %bb3
  %_8 = bitcast %"std::sync::poison::Flag"* %self to %"core::sync::atomic::AtomicBool"*
  store i8 0, i8* %_9, align 1
  %4 = load i8, i8* %_9, align 1, !range !2, !noundef !1
; call core::sync::atomic::AtomicBool::store
  call void @_ZN4core4sync6atomic10AtomicBool5store17h500a00be0423b27aE(%"core::sync::atomic::AtomicBool"* align 1 %_8, i1 zeroext true, i8 %4)
  br label %bb6

bb6:                                              ; preds = %bb5
  br label %bb7
}

; std::sync::poison::Flag::guard
; Function Attrs: inlinehint uwtable
define internal { i8, i8 } @_ZN3std4sync6poison4Flag5guard17h347590fd9b46f56aE(%"std::sync::poison::Flag"* align 1 %self) unnamed_addr #0 {
start:
  %ret = alloca i8, align 1
  %0 = alloca { i8, i8 }, align 1
; call std::thread::panicking
  %_3 = call zeroext i1 @_ZN3std6thread9panicking17h7e73bd8d6d60a5cfE()
  br label %bb1

bb1:                                              ; preds = %start
  %1 = zext i1 %_3 to i8
  store i8 %1, i8* %ret, align 1
; call std::sync::poison::Flag::get
  %_4 = call zeroext i1 @_ZN3std4sync6poison4Flag3get17hb2d5942202adec41E(%"std::sync::poison::Flag"* align 1 %self)
  br label %bb2

bb2:                                              ; preds = %bb1
  br i1 %_4, label %bb3, label %bb5

bb5:                                              ; preds = %bb2
  %2 = load i8, i8* %ret, align 1, !range !5, !noundef !1
  %_8 = trunc i8 %2 to i1
  %3 = getelementptr inbounds { i8, i8 }, { i8, i8 }* %0, i32 0, i32 1
  %4 = zext i1 %_8 to i8
  store i8 %4, i8* %3, align 1
  %5 = bitcast { i8, i8 }* %0 to i8*
  store i8 0, i8* %5, align 1
  br label %bb6

bb3:                                              ; preds = %bb2
  %6 = load i8, i8* %ret, align 1, !range !5, !noundef !1
  %_7 = trunc i8 %6 to i1
; call std::sync::poison::PoisonError<T>::new
  %_6 = call zeroext i1 @"_ZN3std4sync6poison20PoisonError$LT$T$GT$3new17h84b5728872323ef3E"(i1 zeroext %_7)
  br label %bb4

bb4:                                              ; preds = %bb3
  %7 = getelementptr inbounds { i8, i8 }, { i8, i8 }* %0, i32 0, i32 1
  %8 = zext i1 %_6 to i8
  store i8 %8, i8* %7, align 1
  %9 = bitcast { i8, i8 }* %0 to i8*
  store i8 1, i8* %9, align 1
  br label %bb6

bb6:                                              ; preds = %bb5, %bb4
  %10 = getelementptr inbounds { i8, i8 }, { i8, i8 }* %0, i32 0, i32 0
  %11 = load i8, i8* %10, align 1, !range !5, !noundef !1
  %12 = trunc i8 %11 to i1
  %13 = getelementptr inbounds { i8, i8 }, { i8, i8 }* %0, i32 0, i32 1
  %14 = load i8, i8* %13, align 1
  %15 = zext i1 %12 to i8
  %16 = insertvalue { i8, i8 } undef, i8 %15, 0
  %17 = insertvalue { i8, i8 } %16, i8 %14, 1
  ret { i8, i8 } %17
}

; std::thread::panicking
; Function Attrs: inlinehint uwtable
define internal zeroext i1 @_ZN3std6thread9panicking17h7e73bd8d6d60a5cfE() unnamed_addr #0 {
start:
; call std::panicking::panicking
  %0 = call zeroext i1 @_ZN3std9panicking9panicking17hcc1fa134b53b975bE()
  br label %bb1

bb1:                                              ; preds = %start
  ret i1 %0
}

; std::panicking::panic_count::count_is_zero
; Function Attrs: inlinehint uwtable
define internal zeroext i1 @_ZN3std9panicking11panic_count13count_is_zero17hc756717b0c791ee9E() unnamed_addr #0 {
start:
  %_5 = alloca i8, align 1
  %0 = alloca i8, align 1
  store i8 0, i8* %_5, align 1
  %1 = load i8, i8* %_5, align 1, !range !2, !noundef !1
; call core::sync::atomic::AtomicUsize::load
  %_2 = call i64 @_ZN4core4sync6atomic11AtomicUsize4load17h15559b63d9680126E(%"core::sync::atomic::AtomicUsize"* align 8 @_ZN3std9panicking11panic_count18GLOBAL_PANIC_COUNT17h2b64f86644a1a3eeE, i8 %1)
  br label %bb1

bb1:                                              ; preds = %start
  %_1 = and i64 %_2, 9223372036854775807
  %2 = icmp eq i64 %_1, 0
  br i1 %2, label %bb2, label %bb3

bb2:                                              ; preds = %bb1
  store i8 1, i8* %0, align 1
  br label %bb4

bb3:                                              ; preds = %bb1
; call std::panicking::panic_count::is_zero_slow_path
  %3 = call zeroext i1 @_ZN3std9panicking11panic_count17is_zero_slow_path17h203a8ec265315145E()
  %4 = zext i1 %3 to i8
  store i8 %4, i8* %0, align 1
  br label %bb4

bb4:                                              ; preds = %bb2, %bb3
  %5 = load i8, i8* %0, align 1, !range !5, !noundef !1
  %6 = trunc i8 %5 to i1
  ret i1 %6
}

; std::panicking::panicking
; Function Attrs: inlinehint uwtable
define internal zeroext i1 @_ZN3std9panicking9panicking17hcc1fa134b53b975bE() unnamed_addr #0 {
start:
; call std::panicking::panic_count::count_is_zero
  %_1 = call zeroext i1 @_ZN3std9panicking11panic_count13count_is_zero17hc756717b0c791ee9E()
  br label %bb1

bb1:                                              ; preds = %start
  %0 = xor i1 %_1, true
  ret i1 %0
}

; core::fmt::Arguments::new_v1
; Function Attrs: inlinehint uwtable
define internal void @_ZN4core3fmt9Arguments6new_v117h5293e2b1d9130edfE(%"core::fmt::Arguments"* sret(%"core::fmt::Arguments") %0, [0 x { [0 x i8]*, i64 }]* align 8 %pieces.0, i64 %pieces.1, [0 x { i8*, i64* }]* align 8 %args.0, i64 %args.1) unnamed_addr #0 {
start:
  %_24 = alloca { i64*, i64 }, align 8
  %_16 = alloca %"core::fmt::Arguments", align 8
  %_3 = alloca i8, align 1
  %_4 = icmp ult i64 %pieces.1, %args.1
  br i1 %_4, label %bb1, label %bb2

bb2:                                              ; preds = %start
  %_12 = add i64 %args.1, 1
  %_9 = icmp ugt i64 %pieces.1, %_12
  %1 = zext i1 %_9 to i8
  store i8 %1, i8* %_3, align 1
  br label %bb3

bb1:                                              ; preds = %start
  store i8 1, i8* %_3, align 1
  br label %bb3

bb3:                                              ; preds = %bb2, %bb1
  %2 = load i8, i8* %_3, align 1, !range !5, !noundef !1
  %3 = trunc i8 %2 to i1
  br i1 %3, label %bb4, label %bb6

bb6:                                              ; preds = %bb3
  %4 = bitcast { i64*, i64 }* %_24 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 8 %4, i8 0, i64 16, i1 false)
  %5 = bitcast { i64*, i64 }* %_24 to {}**
  store {}* null, {}** %5, align 8
  %6 = bitcast %"core::fmt::Arguments"* %0 to { [0 x { [0 x i8]*, i64 }]*, i64 }*
  %7 = getelementptr inbounds { [0 x { [0 x i8]*, i64 }]*, i64 }, { [0 x { [0 x i8]*, i64 }]*, i64 }* %6, i32 0, i32 0
  store [0 x { [0 x i8]*, i64 }]* %pieces.0, [0 x { [0 x i8]*, i64 }]** %7, align 8
  %8 = getelementptr inbounds { [0 x { [0 x i8]*, i64 }]*, i64 }, { [0 x { [0 x i8]*, i64 }]*, i64 }* %6, i32 0, i32 1
  store i64 %pieces.1, i64* %8, align 8
  %9 = getelementptr inbounds %"core::fmt::Arguments", %"core::fmt::Arguments"* %0, i32 0, i32 1
  %10 = getelementptr inbounds { i64*, i64 }, { i64*, i64 }* %_24, i32 0, i32 0
  %11 = load i64*, i64** %10, align 8, !align !4
  %12 = getelementptr inbounds { i64*, i64 }, { i64*, i64 }* %_24, i32 0, i32 1
  %13 = load i64, i64* %12, align 8
  %14 = getelementptr inbounds { i64*, i64 }, { i64*, i64 }* %9, i32 0, i32 0
  store i64* %11, i64** %14, align 8
  %15 = getelementptr inbounds { i64*, i64 }, { i64*, i64 }* %9, i32 0, i32 1
  store i64 %13, i64* %15, align 8
  %16 = getelementptr inbounds %"core::fmt::Arguments", %"core::fmt::Arguments"* %0, i32 0, i32 2
  %17 = getelementptr inbounds { [0 x { i8*, i64* }]*, i64 }, { [0 x { i8*, i64* }]*, i64 }* %16, i32 0, i32 0
  store [0 x { i8*, i64* }]* %args.0, [0 x { i8*, i64* }]** %17, align 8
  %18 = getelementptr inbounds { [0 x { i8*, i64* }]*, i64 }, { [0 x { i8*, i64* }]*, i64 }* %16, i32 0, i32 1
  store i64 %args.1, i64* %18, align 8
  ret void

bb4:                                              ; preds = %bb3
; call core::fmt::Arguments::new_v1
  call void @_ZN4core3fmt9Arguments6new_v117h5293e2b1d9130edfE(%"core::fmt::Arguments"* sret(%"core::fmt::Arguments") %_16, [0 x { [0 x i8]*, i64 }]* align 8 bitcast (<{ i8*, [8 x i8] }>* @alloc39 to [0 x { [0 x i8]*, i64 }]*), i64 1, [0 x { i8*, i64* }]* align 8 bitcast (<{}>* @alloc56 to [0 x { i8*, i64* }]*), i64 0)
  br label %bb5

bb5:                                              ; preds = %bb4
; call core::panicking::panic_fmt
  call void @_ZN4core9panicking9panic_fmt17h9fec86f6a9c4146eE(%"core::fmt::Arguments"* %_16, %"core::panic::location::Location"* align 8 bitcast (<{ i8*, [16 x i8] }>* @alloc155 to %"core::panic::location::Location"*)) #10
  unreachable
}

; core::mem::valid_align::ValidAlign::as_nonzero
; Function Attrs: inlinehint uwtable
define internal i64 @_ZN4core3mem11valid_align10ValidAlign10as_nonzero17hfa17014517a3b97eE(i64 %self) unnamed_addr #0 {
start:
  %0 = icmp uge i64 %self, 1
  call void @llvm.assume(i1 %0)
  %1 = icmp ule i64 %self, -9223372036854775808
  call void @llvm.assume(i1 %1)
; call core::num::nonzero::NonZeroUsize::new_unchecked
  %2 = call i64 @_ZN4core3num7nonzero12NonZeroUsize13new_unchecked17h6907c27997894e8fE(i64 %self), !range !6
  br label %bb1

bb1:                                              ; preds = %start
  ret i64 %2
}

; core::mem::valid_align::ValidAlign::new_unchecked
; Function Attrs: inlinehint uwtable
define internal i64 @_ZN4core3mem11valid_align10ValidAlign13new_unchecked17h24ea801e8192e25dE(i64 %align) unnamed_addr #0 {
start:
  %0 = alloca i64, align 8
  store i64 %align, i64* %0, align 8
  %1 = load i64, i64* %0, align 8, !range !7, !noundef !1
  br label %bb1

bb1:                                              ; preds = %start
  ret i64 %1
}

; core::mem::drop
; Function Attrs: inlinehint uwtable
define void @_ZN4core3mem4drop17hb6b217fed38f815aE(%"std::sys::unix::locks::pthread_mutex::Mutex"* align 8 %0) unnamed_addr #0 {
start:
  %_x = alloca %"std::sys::unix::locks::pthread_mutex::Mutex"*, align 8
  store %"std::sys::unix::locks::pthread_mutex::Mutex"* %0, %"std::sys::unix::locks::pthread_mutex::Mutex"** %_x, align 8
; call core::ptr::drop_in_place<alloc::boxed::Box<std::sys::unix::locks::pthread_mutex::Mutex>>
  call void @"_ZN4core3ptr89drop_in_place$LT$alloc..boxed..Box$LT$std..sys..unix..locks..pthread_mutex..Mutex$GT$$GT$17h36cda168f1e87447E"(%"std::sys::unix::locks::pthread_mutex::Mutex"** %_x)
  br label %bb1

bb1:                                              ; preds = %start
  ret void
}

; core::num::nonzero::NonZeroUsize::new_unchecked
; Function Attrs: inlinehint uwtable
define internal i64 @_ZN4core3num7nonzero12NonZeroUsize13new_unchecked17h6907c27997894e8fE(i64 %n) unnamed_addr #0 {
start:
  %0 = alloca i64, align 8
  store i64 %n, i64* %0, align 8
  %1 = load i64, i64* %0, align 8, !range !6, !noundef !1
  ret i64 %1
}

; core::num::nonzero::NonZeroUsize::get
; Function Attrs: inlinehint uwtable
define internal i64 @_ZN4core3num7nonzero12NonZeroUsize3get17ha400b61e506565cfE(i64 %self) unnamed_addr #0 {
start:
  ret i64 %self
}

; core::ptr::drop_in_place<std::sys_common::lazy_box::LazyBox<std::sys::unix::locks::pthread_mutex::Mutex>>
; Function Attrs: uwtable
define void @"_ZN4core3ptr106drop_in_place$LT$std..sys_common..lazy_box..LazyBox$LT$std..sys..unix..locks..pthread_mutex..Mutex$GT$$GT$17hd28889167f69f630E"(%"std::sys_common::lazy_box::LazyBox<std::sys::unix::locks::pthread_mutex::Mutex>"* %_1) unnamed_addr #2 {
start:
; call <std::sys_common::lazy_box::LazyBox<T> as core::ops::drop::Drop>::drop
  call void @"_ZN85_$LT$std..sys_common..lazy_box..LazyBox$LT$T$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17hf9e8f9b25263dc25E"(%"std::sys_common::lazy_box::LazyBox<std::sys::unix::locks::pthread_mutex::Mutex>"* align 8 %_1)
  br label %bb1

bb1:                                              ; preds = %start
  ret void
}

; core::ptr::read
; Function Attrs: inlinehint uwtable
define void @_ZN4core3ptr4read17h649c16c5d403d551E(%"alloc::alloc::Global"* %src) unnamed_addr #0 {
start:
  %0 = alloca %"core::mem::maybe_uninit::MaybeUninit<alloc::alloc::Global>", align 1
  %tmp = alloca %"core::mem::maybe_uninit::MaybeUninit<alloc::alloc::Global>", align 1
  %1 = bitcast %"core::mem::maybe_uninit::MaybeUninit<alloc::alloc::Global>"* %0 to {}*
  br label %bb1

bb1:                                              ; preds = %start
  %2 = bitcast %"core::mem::maybe_uninit::MaybeUninit<alloc::alloc::Global>"* %tmp to %"alloc::alloc::Global"*
  br label %bb2

bb2:                                              ; preds = %bb1
  %3 = bitcast %"alloc::alloc::Global"* %2 to i8*
  %4 = bitcast %"alloc::alloc::Global"* %src to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %3, i8* align 1 %4, i64 0, i1 false)
  br label %bb3

bb3:                                              ; preds = %bb2
  ret void
}

; core::ptr::drop_in_place<std::sync::mutex::Mutex<i32>>
; Function Attrs: uwtable
define void @"_ZN4core3ptr55drop_in_place$LT$std..sync..mutex..Mutex$LT$i32$GT$$GT$17hdc338ded0e445c4eE"(%"std::sync::mutex::Mutex<i32>"* %_1) unnamed_addr #2 {
start:
  %0 = bitcast %"std::sync::mutex::Mutex<i32>"* %_1 to %"std::sys_common::mutex::MovableMutex"*
; call core::ptr::drop_in_place<std::sys_common::mutex::MovableMutex>
  call void @"_ZN4core3ptr57drop_in_place$LT$std..sys_common..mutex..MovableMutex$GT$17hdad6ac4226762814E"(%"std::sys_common::mutex::MovableMutex"* %0)
  br label %bb1

bb1:                                              ; preds = %start
  ret void
}

; core::ptr::drop_in_place<std::sys_common::mutex::MovableMutex>
; Function Attrs: uwtable
define void @"_ZN4core3ptr57drop_in_place$LT$std..sys_common..mutex..MovableMutex$GT$17hdad6ac4226762814E"(%"std::sys_common::mutex::MovableMutex"* %_1) unnamed_addr #2 {
start:
  %0 = bitcast %"std::sys_common::mutex::MovableMutex"* %_1 to %"std::sys_common::lazy_box::LazyBox<std::sys::unix::locks::pthread_mutex::Mutex>"*
; call core::ptr::drop_in_place<std::sys_common::lazy_box::LazyBox<std::sys::unix::locks::pthread_mutex::Mutex>>
  call void @"_ZN4core3ptr106drop_in_place$LT$std..sys_common..lazy_box..LazyBox$LT$std..sys..unix..locks..pthread_mutex..Mutex$GT$$GT$17hd28889167f69f630E"(%"std::sys_common::lazy_box::LazyBox<std::sys::unix::locks::pthread_mutex::Mutex>"* %0)
  br label %bb1

bb1:                                              ; preds = %start
  ret void
}

; core::ptr::drop_in_place<std::sync::mutex::MutexGuard<i32>>
; Function Attrs: uwtable
define void @"_ZN4core3ptr60drop_in_place$LT$std..sync..mutex..MutexGuard$LT$i32$GT$$GT$17ha951d3a81801c8e0E"({ i64*, i8 }* %_1) unnamed_addr #2 {
start:
; call <std::sync::mutex::MutexGuard<T> as core::ops::drop::Drop>::drop
  call void @"_ZN79_$LT$std..sync..mutex..MutexGuard$LT$T$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17hc084df6b6e1df28aE"({ i64*, i8 }* align 8 %_1)
  br label %bb1

bb1:                                              ; preds = %start
  ret void
}

; core::ptr::drop_in_place<std::sys::unix::locks::pthread_mutex::Mutex>
; Function Attrs: uwtable
define void @"_ZN4core3ptr64drop_in_place$LT$std..sys..unix..locks..pthread_mutex..Mutex$GT$17h10505314e74441bcE"(%"std::sys::unix::locks::pthread_mutex::Mutex"* %_1) unnamed_addr #2 {
start:
; call <std::sys::unix::locks::pthread_mutex::Mutex as core::ops::drop::Drop>::drop
  call void @"_ZN85_$LT$std..sys..unix..locks..pthread_mutex..Mutex$u20$as$u20$core..ops..drop..Drop$GT$4drop17h3353513b544a07c3E"(%"std::sys::unix::locks::pthread_mutex::Mutex"* align 8 %_1)
  br label %bb1

bb1:                                              ; preds = %start
  ret void
}

; core::ptr::unique::Unique<T>::new_unchecked
; Function Attrs: inlinehint uwtable
define i64* @"_ZN4core3ptr6unique15Unique$LT$T$GT$13new_unchecked17h7c7f45e4a5387838E"(%"std::sys::unix::locks::pthread_mutex::Mutex"* %ptr) unnamed_addr #0 {
start:
  %0 = alloca i64*, align 8
; call core::ptr::non_null::NonNull<T>::new_unchecked
  %_2 = call i64* @"_ZN4core3ptr8non_null16NonNull$LT$T$GT$13new_unchecked17h87e7ccd3360b490fE"(%"std::sys::unix::locks::pthread_mutex::Mutex"* %ptr)
  br label %bb1

bb1:                                              ; preds = %start
  store i64* %_2, i64** %0, align 8
  %1 = load i64*, i64** %0, align 8, !nonnull !1, !noundef !1
  ret i64* %1
}

; core::ptr::unique::Unique<T>::cast
; Function Attrs: inlinehint uwtable
define i8* @"_ZN4core3ptr6unique15Unique$LT$T$GT$4cast17hf053bf66ea7f63f9E"(i64* %self) unnamed_addr #0 {
start:
; call core::ptr::non_null::NonNull<T>::cast
  %_2 = call i8* @"_ZN4core3ptr8non_null16NonNull$LT$T$GT$4cast17hb544c24bd443a6c0E"(i64* %self)
  br label %bb1

bb1:                                              ; preds = %start
; call <core::ptr::unique::Unique<T> as core::convert::From<core::ptr::non_null::NonNull<T>>>::from
  %0 = call i8* @"_ZN119_$LT$core..ptr..unique..Unique$LT$T$GT$$u20$as$u20$core..convert..From$LT$core..ptr..non_null..NonNull$LT$T$GT$$GT$$GT$4from17h04b01aa57467542eE"(i8* %_2)
  br label %bb2

bb2:                                              ; preds = %bb1
  ret i8* %0
}

; core::ptr::unique::Unique<T>::as_ptr
; Function Attrs: inlinehint uwtable
define i8* @"_ZN4core3ptr6unique15Unique$LT$T$GT$6as_ptr17hd9dbcab12a4828f4E"(i8* %self) unnamed_addr #0 {
start:
; call core::ptr::non_null::NonNull<T>::as_ptr
  %0 = call i8* @"_ZN4core3ptr8non_null16NonNull$LT$T$GT$6as_ptr17h6fe713df0759bcaaE"(i8* %self)
  br label %bb1

bb1:                                              ; preds = %start
  ret i8* %0
}

; core::ptr::unique::Unique<T>::as_ptr
; Function Attrs: inlinehint uwtable
define %"std::sys::unix::locks::pthread_mutex::Mutex"* @"_ZN4core3ptr6unique15Unique$LT$T$GT$6as_ptr17heac80e6fd9ce1173E"(i64* %self) unnamed_addr #0 {
start:
; call core::ptr::non_null::NonNull<T>::as_ptr
  %0 = call %"std::sys::unix::locks::pthread_mutex::Mutex"* @"_ZN4core3ptr8non_null16NonNull$LT$T$GT$6as_ptr17hc83ab01341face7dE"(i64* %self)
  br label %bb1

bb1:                                              ; preds = %start
  ret %"std::sys::unix::locks::pthread_mutex::Mutex"* %0
}

; core::ptr::unique::Unique<T>::as_ref
; Function Attrs: inlinehint uwtable
define align 8 %"std::sys::unix::locks::pthread_mutex::Mutex"* @"_ZN4core3ptr6unique15Unique$LT$T$GT$6as_ref17h63a05b0955c85c23E"(i64** align 8 %self) unnamed_addr #0 {
start:
; call core::ptr::non_null::NonNull<T>::as_ref
  %0 = call align 8 %"std::sys::unix::locks::pthread_mutex::Mutex"* @"_ZN4core3ptr8non_null16NonNull$LT$T$GT$6as_ref17h8356a459c3acfd19E"(i64** align 8 %self)
  br label %bb1

bb1:                                              ; preds = %start
  ret %"std::sys::unix::locks::pthread_mutex::Mutex"* %0
}

; core::ptr::mut_ptr::<impl *mut T>::guaranteed_eq
; Function Attrs: inlinehint uwtable
define zeroext i1 @"_ZN4core3ptr7mut_ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$13guaranteed_eq17h4c9e785c89f6d351E"(i8* %self, i8* %other) unnamed_addr #0 {
start:
  %0 = alloca i8, align 1
  %1 = icmp eq i8* %self, %other
  %2 = zext i1 %1 to i8
  store i8 %2, i8* %0, align 1
  %3 = load i8, i8* %0, align 1, !range !5, !noundef !1
  %4 = trunc i8 %3 to i1
  br label %bb1

bb1:                                              ; preds = %start
  ret i1 %4
}

; core::ptr::mut_ptr::<impl *mut T>::is_null
; Function Attrs: inlinehint uwtable
define zeroext i1 @"_ZN4core3ptr7mut_ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$7is_null17h712b26941d61c13aE"(%"std::sys::unix::locks::pthread_mutex::Mutex"* %self) unnamed_addr #0 {
start:
  %0 = alloca {}*, align 8
  %_2 = bitcast %"std::sys::unix::locks::pthread_mutex::Mutex"* %self to i8*
  %1 = bitcast {}** %0 to i64*
  store i64 0, i64* %1, align 8
  %2 = load {}*, {}** %0, align 8
; call core::ptr::metadata::from_raw_parts_mut
  %3 = call i8* @_ZN4core3ptr8metadata18from_raw_parts_mut17hd2a9258771ec8c73E({}* %2)
  br label %bb1

bb1:                                              ; preds = %start
; call core::ptr::mut_ptr::<impl *mut T>::guaranteed_eq
  %4 = call zeroext i1 @"_ZN4core3ptr7mut_ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$13guaranteed_eq17h4c9e785c89f6d351E"(i8* %_2, i8* %3)
  br label %bb2

bb2:                                              ; preds = %bb1
  ret i1 %4
}

; core::ptr::drop_in_place<alloc::boxed::Box<std::sys::unix::locks::pthread_mutex::Mutex>>
; Function Attrs: uwtable
define void @"_ZN4core3ptr89drop_in_place$LT$alloc..boxed..Box$LT$std..sys..unix..locks..pthread_mutex..Mutex$GT$$GT$17h36cda168f1e87447E"(%"std::sys::unix::locks::pthread_mutex::Mutex"** %_1) unnamed_addr #2 personality i32 (i32, i32, i64, %"unwind::libunwind::_Unwind_Exception"*, %"unwind::libunwind::_Unwind_Context"*)* @rust_eh_personality {
start:
  %0 = alloca { i8*, i32 }, align 8
  %1 = bitcast %"std::sys::unix::locks::pthread_mutex::Mutex"** %_1 to i64**
  %2 = bitcast i64** %1 to %"std::sys::unix::locks::pthread_mutex::Mutex"**
  %3 = load %"std::sys::unix::locks::pthread_mutex::Mutex"*, %"std::sys::unix::locks::pthread_mutex::Mutex"** %2, align 8
; invoke core::ptr::drop_in_place<std::sys::unix::locks::pthread_mutex::Mutex>
  invoke void @"_ZN4core3ptr64drop_in_place$LT$std..sys..unix..locks..pthread_mutex..Mutex$GT$17h10505314e74441bcE"(%"std::sys::unix::locks::pthread_mutex::Mutex"* %3)
          to label %bb3 unwind label %cleanup

bb4:                                              ; preds = %cleanup
  %4 = bitcast %"std::sys::unix::locks::pthread_mutex::Mutex"** %_1 to i64**
  %5 = load i64*, i64** %4, align 8, !nonnull !1, !noundef !1
; invoke alloc::alloc::box_free
  invoke void @_ZN5alloc5alloc8box_free17h9974f85a1dcd1780E(i64* %5) #11
          to label %bb2 unwind label %abort

cleanup:                                          ; preds = %start
  %6 = landingpad { i8*, i32 }
          cleanup
  %7 = extractvalue { i8*, i32 } %6, 0
  %8 = extractvalue { i8*, i32 } %6, 1
  %9 = getelementptr inbounds { i8*, i32 }, { i8*, i32 }* %0, i32 0, i32 0
  store i8* %7, i8** %9, align 8
  %10 = getelementptr inbounds { i8*, i32 }, { i8*, i32 }* %0, i32 0, i32 1
  store i32 %8, i32* %10, align 8
  br label %bb4

bb3:                                              ; preds = %start
  %11 = bitcast %"std::sys::unix::locks::pthread_mutex::Mutex"** %_1 to i64**
  %12 = load i64*, i64** %11, align 8, !nonnull !1, !noundef !1
; call alloc::alloc::box_free
  call void @_ZN5alloc5alloc8box_free17h9974f85a1dcd1780E(i64* %12)
  br label %bb1

abort:                                            ; preds = %bb4
  %13 = landingpad { i8*, i32 }
          cleanup
; call core::panicking::panic_no_unwind
  call void @_ZN4core9panicking15panic_no_unwind17hfdf5806230424742E() #12
  unreachable

bb2:                                              ; preds = %bb4
  %14 = bitcast { i8*, i32 }* %0 to i8**
  %15 = load i8*, i8** %14, align 8
  %16 = getelementptr inbounds { i8*, i32 }, { i8*, i32 }* %0, i32 0, i32 1
  %17 = load i32, i32* %16, align 8
  %18 = insertvalue { i8*, i32 } undef, i8* %15, 0
  %19 = insertvalue { i8*, i32 } %18, i32 %17, 1
  resume { i8*, i32 } %19

bb1:                                              ; preds = %bb3
  ret void
}

; core::ptr::metadata::from_raw_parts_mut
; Function Attrs: inlinehint uwtable
define i8* @_ZN4core3ptr8metadata18from_raw_parts_mut17hd2a9258771ec8c73E({}* %data_address) unnamed_addr #0 {
start:
  %_4 = alloca %"core::ptr::metadata::PtrComponents<u8>", align 8
  %_3 = alloca %"core::ptr::metadata::PtrRepr<u8>", align 8
  %0 = bitcast %"core::ptr::metadata::PtrComponents<u8>"* %_4 to {}**
  store {}* %data_address, {}** %0, align 8
  %1 = getelementptr inbounds %"core::ptr::metadata::PtrComponents<u8>", %"core::ptr::metadata::PtrComponents<u8>"* %_4, i32 0, i32 1
  %2 = bitcast %"core::ptr::metadata::PtrRepr<u8>"* %_3 to %"core::ptr::metadata::PtrComponents<u8>"*
  %3 = bitcast %"core::ptr::metadata::PtrComponents<u8>"* %2 to i8*
  %4 = bitcast %"core::ptr::metadata::PtrComponents<u8>"* %_4 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %3, i8* align 8 %4, i64 8, i1 false)
  %5 = bitcast %"core::ptr::metadata::PtrRepr<u8>"* %_3 to i8**
  %6 = load i8*, i8** %5, align 8
  ret i8* %6
}

; core::ptr::metadata::from_raw_parts_mut
; Function Attrs: inlinehint uwtable
define %"std::sys::unix::locks::pthread_mutex::Mutex"* @_ZN4core3ptr8metadata18from_raw_parts_mut17hed9aa0e0c0f4e3dfE({}* %data_address) unnamed_addr #0 {
start:
  %_4 = alloca %"core::ptr::metadata::PtrComponents<std::sys::unix::locks::pthread_mutex::Mutex>", align 8
  %_3 = alloca %"core::ptr::metadata::PtrRepr<std::sys::unix::locks::pthread_mutex::Mutex>", align 8
  %0 = bitcast %"core::ptr::metadata::PtrComponents<std::sys::unix::locks::pthread_mutex::Mutex>"* %_4 to {}**
  store {}* %data_address, {}** %0, align 8
  %1 = getelementptr inbounds %"core::ptr::metadata::PtrComponents<std::sys::unix::locks::pthread_mutex::Mutex>", %"core::ptr::metadata::PtrComponents<std::sys::unix::locks::pthread_mutex::Mutex>"* %_4, i32 0, i32 1
  %2 = bitcast %"core::ptr::metadata::PtrRepr<std::sys::unix::locks::pthread_mutex::Mutex>"* %_3 to %"core::ptr::metadata::PtrComponents<std::sys::unix::locks::pthread_mutex::Mutex>"*
  %3 = bitcast %"core::ptr::metadata::PtrComponents<std::sys::unix::locks::pthread_mutex::Mutex>"* %2 to i8*
  %4 = bitcast %"core::ptr::metadata::PtrComponents<std::sys::unix::locks::pthread_mutex::Mutex>"* %_4 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %3, i8* align 8 %4, i64 8, i1 false)
  %5 = bitcast %"core::ptr::metadata::PtrRepr<std::sys::unix::locks::pthread_mutex::Mutex>"* %_3 to %"std::sys::unix::locks::pthread_mutex::Mutex"**
  %6 = load %"std::sys::unix::locks::pthread_mutex::Mutex"*, %"std::sys::unix::locks::pthread_mutex::Mutex"** %5, align 8
  ret %"std::sys::unix::locks::pthread_mutex::Mutex"* %6
}

; core::ptr::non_null::NonNull<T>::new_unchecked
; Function Attrs: inlinehint uwtable
define i64* @"_ZN4core3ptr8non_null16NonNull$LT$T$GT$13new_unchecked17h87e7ccd3360b490fE"(%"std::sys::unix::locks::pthread_mutex::Mutex"* %ptr) unnamed_addr #0 {
start:
  %0 = alloca i64*, align 8
  %1 = bitcast i64** %0 to %"std::sys::unix::locks::pthread_mutex::Mutex"**
  store %"std::sys::unix::locks::pthread_mutex::Mutex"* %ptr, %"std::sys::unix::locks::pthread_mutex::Mutex"** %1, align 8
  %2 = load i64*, i64** %0, align 8, !nonnull !1, !noundef !1
  ret i64* %2
}

; core::ptr::non_null::NonNull<T>::new_unchecked
; Function Attrs: inlinehint uwtable
define i8* @"_ZN4core3ptr8non_null16NonNull$LT$T$GT$13new_unchecked17hbb5feb28f16b533fE"(i8* %ptr) unnamed_addr #0 {
start:
  %0 = alloca i8*, align 8
  store i8* %ptr, i8** %0, align 8
  %1 = load i8*, i8** %0, align 8, !nonnull !1, !noundef !1
  ret i8* %1
}

; core::ptr::non_null::NonNull<T>::cast
; Function Attrs: inlinehint uwtable
define i8* @"_ZN4core3ptr8non_null16NonNull$LT$T$GT$4cast17hb544c24bd443a6c0E"(i64* %self) unnamed_addr #0 {
start:
; call core::ptr::non_null::NonNull<T>::as_ptr
  %_3 = call %"std::sys::unix::locks::pthread_mutex::Mutex"* @"_ZN4core3ptr8non_null16NonNull$LT$T$GT$6as_ptr17hc83ab01341face7dE"(i64* %self)
  br label %bb1

bb1:                                              ; preds = %start
  %_2 = bitcast %"std::sys::unix::locks::pthread_mutex::Mutex"* %_3 to i8*
; call core::ptr::non_null::NonNull<T>::new_unchecked
  %0 = call i8* @"_ZN4core3ptr8non_null16NonNull$LT$T$GT$13new_unchecked17hbb5feb28f16b533fE"(i8* %_2)
  br label %bb2

bb2:                                              ; preds = %bb1
  ret i8* %0
}

; core::ptr::non_null::NonNull<T>::as_ptr
; Function Attrs: inlinehint uwtable
define i8* @"_ZN4core3ptr8non_null16NonNull$LT$T$GT$6as_ptr17h6fe713df0759bcaaE"(i8* %self) unnamed_addr #0 {
start:
  ret i8* %self
}

; core::ptr::non_null::NonNull<T>::as_ptr
; Function Attrs: inlinehint uwtable
define %"std::sys::unix::locks::pthread_mutex::Mutex"* @"_ZN4core3ptr8non_null16NonNull$LT$T$GT$6as_ptr17hc83ab01341face7dE"(i64* %self) unnamed_addr #0 {
start:
  %_2 = bitcast i64* %self to %"std::sys::unix::locks::pthread_mutex::Mutex"*
  ret %"std::sys::unix::locks::pthread_mutex::Mutex"* %_2
}

; core::ptr::non_null::NonNull<T>::as_ref
; Function Attrs: inlinehint uwtable
define align 8 %"std::sys::unix::locks::pthread_mutex::Mutex"* @"_ZN4core3ptr8non_null16NonNull$LT$T$GT$6as_ref17h8356a459c3acfd19E"(i64** align 8 %self) unnamed_addr #0 {
start:
  %_3 = load i64*, i64** %self, align 8, !nonnull !1, !noundef !1
; call core::ptr::non_null::NonNull<T>::as_ptr
  %_2 = call %"std::sys::unix::locks::pthread_mutex::Mutex"* @"_ZN4core3ptr8non_null16NonNull$LT$T$GT$6as_ptr17hc83ab01341face7dE"(i64* %_3)
  br label %bb1

bb1:                                              ; preds = %start
  ret %"std::sys::unix::locks::pthread_mutex::Mutex"* %_2
}

; core::ptr::drop_in_place<std::sync::poison::PoisonError<std::sync::mutex::MutexGuard<i32>>>
; Function Attrs: uwtable
define void @"_ZN4core3ptr98drop_in_place$LT$std..sync..poison..PoisonError$LT$std..sync..mutex..MutexGuard$LT$i32$GT$$GT$$GT$17h3b12ccb00e013112E"({ i64*, i8 }* %_1) unnamed_addr #2 {
start:
; call core::ptr::drop_in_place<std::sync::mutex::MutexGuard<i32>>
  call void @"_ZN4core3ptr60drop_in_place$LT$std..sync..mutex..MutexGuard$LT$i32$GT$$GT$17ha951d3a81801c8e0E"({ i64*, i8 }* %_1)
  br label %bb1

bb1:                                              ; preds = %start
  ret void
}

; core::sync::atomic::AtomicBool::load
; Function Attrs: inlinehint uwtable
define internal zeroext i1 @_ZN4core4sync6atomic10AtomicBool4load17h754151d4647dff0dE(%"core::sync::atomic::AtomicBool"* align 1 %self, i8 %order) unnamed_addr #0 {
start:
  %_6 = bitcast %"core::sync::atomic::AtomicBool"* %self to i8*
  br label %bb1

bb1:                                              ; preds = %start
; call core::sync::atomic::atomic_load
  %_3 = call i8 @_ZN4core4sync6atomic11atomic_load17h99021ba3a2d44925E(i8* %_6, i8 %order)
  br label %bb2

bb2:                                              ; preds = %bb1
  %0 = icmp ne i8 %_3, 0
  ret i1 %0
}

; core::sync::atomic::AtomicBool::store
; Function Attrs: inlinehint uwtable
define internal void @_ZN4core4sync6atomic10AtomicBool5store17h500a00be0423b27aE(%"core::sync::atomic::AtomicBool"* align 1 %self, i1 zeroext %val, i8 %order) unnamed_addr #0 {
start:
  %_6 = bitcast %"core::sync::atomic::AtomicBool"* %self to i8*
  br label %bb1

bb1:                                              ; preds = %start
  %0 = icmp ule i1 %val, true
  call void @llvm.assume(i1 %0)
  %_7 = zext i1 %val to i8
; call core::sync::atomic::atomic_store
  call void @_ZN4core4sync6atomic12atomic_store17h11b93ef99081d6c8E(i8* %_6, i8 %_7, i8 %order)
  br label %bb2

bb2:                                              ; preds = %bb1
  ret void
}

; core::sync::atomic::AtomicUsize::load
; Function Attrs: inlinehint uwtable
define internal i64 @_ZN4core4sync6atomic11AtomicUsize4load17h15559b63d9680126E(%"core::sync::atomic::AtomicUsize"* align 8 %self, i8 %order) unnamed_addr #0 {
start:
  %_5 = bitcast %"core::sync::atomic::AtomicUsize"* %self to i64*
  br label %bb1

bb1:                                              ; preds = %start
; call core::sync::atomic::atomic_load
  %0 = call i64 @_ZN4core4sync6atomic11atomic_load17h941f11c3c9b6205aE(i64* %_5, i8 %order)
  br label %bb2

bb2:                                              ; preds = %bb1
  ret i64 %0
}

; core::sync::atomic::atomic_load
; Function Attrs: inlinehint uwtable
define i64 @_ZN4core4sync6atomic11atomic_load17h941f11c3c9b6205aE(i64* %dst, i8 %0) unnamed_addr #0 {
start:
  %_16 = alloca %"core::fmt::Arguments", align 8
  %_8 = alloca %"core::fmt::Arguments", align 8
  %1 = alloca i64, align 8
  %order = alloca i8, align 1
  store i8 %0, i8* %order, align 1
  %2 = load i8, i8* %order, align 1, !range !2, !noundef !1
  %_3 = zext i8 %2 to i64
  switch i64 %_3, label %bb2 [
    i64 0, label %bb5
    i64 1, label %bb9
    i64 2, label %bb3
    i64 3, label %bb1
    i64 4, label %bb7
  ]

bb2:                                              ; preds = %start
  unreachable

bb5:                                              ; preds = %start
  %3 = load atomic i64, i64* %dst monotonic, align 8
  store i64 %3, i64* %1, align 8
  br label %bb6

bb9:                                              ; preds = %start
; call core::fmt::Arguments::new_v1
  call void @_ZN4core3fmt9Arguments6new_v117h5293e2b1d9130edfE(%"core::fmt::Arguments"* sret(%"core::fmt::Arguments") %_8, [0 x { [0 x i8]*, i64 }]* align 8 bitcast (<{ i8*, [8 x i8] }>* @alloc34 to [0 x { [0 x i8]*, i64 }]*), i64 1, [0 x { i8*, i64* }]* align 8 bitcast (<{}>* @alloc56 to [0 x { i8*, i64* }]*), i64 0)
  br label %bb10

bb3:                                              ; preds = %start
  %4 = load atomic i64, i64* %dst acquire, align 8
  store i64 %4, i64* %1, align 8
  br label %bb4

bb1:                                              ; preds = %start
; call core::fmt::Arguments::new_v1
  call void @_ZN4core3fmt9Arguments6new_v117h5293e2b1d9130edfE(%"core::fmt::Arguments"* sret(%"core::fmt::Arguments") %_16, [0 x { [0 x i8]*, i64 }]* align 8 bitcast (<{ i8*, [8 x i8] }>* @alloc29 to [0 x { [0 x i8]*, i64 }]*), i64 1, [0 x { i8*, i64* }]* align 8 bitcast (<{}>* @alloc56 to [0 x { i8*, i64* }]*), i64 0)
  br label %bb11

bb7:                                              ; preds = %start
  %5 = load atomic i64, i64* %dst seq_cst, align 8
  store i64 %5, i64* %1, align 8
  br label %bb8

bb8:                                              ; preds = %bb7
  br label %bb12

bb12:                                             ; preds = %bb6, %bb4, %bb8
  %6 = load i64, i64* %1, align 8
  ret i64 %6

bb11:                                             ; preds = %bb1
; call core::panicking::panic_fmt
  call void @_ZN4core9panicking9panic_fmt17h9fec86f6a9c4146eE(%"core::fmt::Arguments"* %_16, %"core::panic::location::Location"* align 8 bitcast (<{ i8*, [16 x i8] }>* @alloc176 to %"core::panic::location::Location"*)) #10
  unreachable

bb4:                                              ; preds = %bb3
  br label %bb12

bb10:                                             ; preds = %bb9
; call core::panicking::panic_fmt
  call void @_ZN4core9panicking9panic_fmt17h9fec86f6a9c4146eE(%"core::fmt::Arguments"* %_8, %"core::panic::location::Location"* align 8 bitcast (<{ i8*, [16 x i8] }>* @alloc178 to %"core::panic::location::Location"*)) #10
  unreachable

bb6:                                              ; preds = %bb5
  br label %bb12
}

; core::sync::atomic::atomic_load
; Function Attrs: inlinehint uwtable
define i8 @_ZN4core4sync6atomic11atomic_load17h99021ba3a2d44925E(i8* %dst, i8 %0) unnamed_addr #0 {
start:
  %_16 = alloca %"core::fmt::Arguments", align 8
  %_8 = alloca %"core::fmt::Arguments", align 8
  %1 = alloca i8, align 1
  %order = alloca i8, align 1
  store i8 %0, i8* %order, align 1
  %2 = load i8, i8* %order, align 1, !range !2, !noundef !1
  %_3 = zext i8 %2 to i64
  switch i64 %_3, label %bb2 [
    i64 0, label %bb5
    i64 1, label %bb9
    i64 2, label %bb3
    i64 3, label %bb1
    i64 4, label %bb7
  ]

bb2:                                              ; preds = %start
  unreachable

bb5:                                              ; preds = %start
  %3 = load atomic i8, i8* %dst monotonic, align 1
  store i8 %3, i8* %1, align 1
  br label %bb6

bb9:                                              ; preds = %start
; call core::fmt::Arguments::new_v1
  call void @_ZN4core3fmt9Arguments6new_v117h5293e2b1d9130edfE(%"core::fmt::Arguments"* sret(%"core::fmt::Arguments") %_8, [0 x { [0 x i8]*, i64 }]* align 8 bitcast (<{ i8*, [8 x i8] }>* @alloc34 to [0 x { [0 x i8]*, i64 }]*), i64 1, [0 x { i8*, i64* }]* align 8 bitcast (<{}>* @alloc56 to [0 x { i8*, i64* }]*), i64 0)
  br label %bb10

bb3:                                              ; preds = %start
  %4 = load atomic i8, i8* %dst acquire, align 1
  store i8 %4, i8* %1, align 1
  br label %bb4

bb1:                                              ; preds = %start
; call core::fmt::Arguments::new_v1
  call void @_ZN4core3fmt9Arguments6new_v117h5293e2b1d9130edfE(%"core::fmt::Arguments"* sret(%"core::fmt::Arguments") %_16, [0 x { [0 x i8]*, i64 }]* align 8 bitcast (<{ i8*, [8 x i8] }>* @alloc29 to [0 x { [0 x i8]*, i64 }]*), i64 1, [0 x { i8*, i64* }]* align 8 bitcast (<{}>* @alloc56 to [0 x { i8*, i64* }]*), i64 0)
  br label %bb11

bb7:                                              ; preds = %start
  %5 = load atomic i8, i8* %dst seq_cst, align 1
  store i8 %5, i8* %1, align 1
  br label %bb8

bb8:                                              ; preds = %bb7
  br label %bb12

bb12:                                             ; preds = %bb6, %bb4, %bb8
  %6 = load i8, i8* %1, align 1
  ret i8 %6

bb11:                                             ; preds = %bb1
; call core::panicking::panic_fmt
  call void @_ZN4core9panicking9panic_fmt17h9fec86f6a9c4146eE(%"core::fmt::Arguments"* %_16, %"core::panic::location::Location"* align 8 bitcast (<{ i8*, [16 x i8] }>* @alloc176 to %"core::panic::location::Location"*)) #10
  unreachable

bb4:                                              ; preds = %bb3
  br label %bb12

bb10:                                             ; preds = %bb9
; call core::panicking::panic_fmt
  call void @_ZN4core9panicking9panic_fmt17h9fec86f6a9c4146eE(%"core::fmt::Arguments"* %_8, %"core::panic::location::Location"* align 8 bitcast (<{ i8*, [16 x i8] }>* @alloc178 to %"core::panic::location::Location"*)) #10
  unreachable

bb6:                                              ; preds = %bb5
  br label %bb12
}

; core::sync::atomic::atomic_load
; Function Attrs: inlinehint uwtable
define %"std::sys::unix::locks::pthread_mutex::Mutex"* @_ZN4core4sync6atomic11atomic_load17hdd83247924c7fd51E(%"std::sys::unix::locks::pthread_mutex::Mutex"** %dst, i8 %0) unnamed_addr #0 {
start:
  %_16 = alloca %"core::fmt::Arguments", align 8
  %_8 = alloca %"core::fmt::Arguments", align 8
  %1 = alloca %"std::sys::unix::locks::pthread_mutex::Mutex"*, align 8
  %order = alloca i8, align 1
  store i8 %0, i8* %order, align 1
  %2 = load i8, i8* %order, align 1, !range !2, !noundef !1
  %_3 = zext i8 %2 to i64
  switch i64 %_3, label %bb2 [
    i64 0, label %bb5
    i64 1, label %bb9
    i64 2, label %bb3
    i64 3, label %bb1
    i64 4, label %bb7
  ]

bb2:                                              ; preds = %start
  unreachable

bb5:                                              ; preds = %start
  %3 = bitcast %"std::sys::unix::locks::pthread_mutex::Mutex"** %dst to i64*
  %4 = load atomic i64, i64* %3 monotonic, align 8
  %5 = inttoptr i64 %4 to %"std::sys::unix::locks::pthread_mutex::Mutex"*
  store %"std::sys::unix::locks::pthread_mutex::Mutex"* %5, %"std::sys::unix::locks::pthread_mutex::Mutex"** %1, align 8
  br label %bb6

bb9:                                              ; preds = %start
; call core::fmt::Arguments::new_v1
  call void @_ZN4core3fmt9Arguments6new_v117h5293e2b1d9130edfE(%"core::fmt::Arguments"* sret(%"core::fmt::Arguments") %_8, [0 x { [0 x i8]*, i64 }]* align 8 bitcast (<{ i8*, [8 x i8] }>* @alloc34 to [0 x { [0 x i8]*, i64 }]*), i64 1, [0 x { i8*, i64* }]* align 8 bitcast (<{}>* @alloc56 to [0 x { i8*, i64* }]*), i64 0)
  br label %bb10

bb3:                                              ; preds = %start
  %6 = bitcast %"std::sys::unix::locks::pthread_mutex::Mutex"** %dst to i64*
  %7 = load atomic i64, i64* %6 acquire, align 8
  %8 = inttoptr i64 %7 to %"std::sys::unix::locks::pthread_mutex::Mutex"*
  store %"std::sys::unix::locks::pthread_mutex::Mutex"* %8, %"std::sys::unix::locks::pthread_mutex::Mutex"** %1, align 8
  br label %bb4

bb1:                                              ; preds = %start
; call core::fmt::Arguments::new_v1
  call void @_ZN4core3fmt9Arguments6new_v117h5293e2b1d9130edfE(%"core::fmt::Arguments"* sret(%"core::fmt::Arguments") %_16, [0 x { [0 x i8]*, i64 }]* align 8 bitcast (<{ i8*, [8 x i8] }>* @alloc29 to [0 x { [0 x i8]*, i64 }]*), i64 1, [0 x { i8*, i64* }]* align 8 bitcast (<{}>* @alloc56 to [0 x { i8*, i64* }]*), i64 0)
  br label %bb11

bb7:                                              ; preds = %start
  %9 = bitcast %"std::sys::unix::locks::pthread_mutex::Mutex"** %dst to i64*
  %10 = load atomic i64, i64* %9 seq_cst, align 8
  %11 = inttoptr i64 %10 to %"std::sys::unix::locks::pthread_mutex::Mutex"*
  store %"std::sys::unix::locks::pthread_mutex::Mutex"* %11, %"std::sys::unix::locks::pthread_mutex::Mutex"** %1, align 8
  br label %bb8

bb8:                                              ; preds = %bb7
  br label %bb12

bb12:                                             ; preds = %bb6, %bb4, %bb8
  %12 = load %"std::sys::unix::locks::pthread_mutex::Mutex"*, %"std::sys::unix::locks::pthread_mutex::Mutex"** %1, align 8
  ret %"std::sys::unix::locks::pthread_mutex::Mutex"* %12

bb11:                                             ; preds = %bb1
; call core::panicking::panic_fmt
  call void @_ZN4core9panicking9panic_fmt17h9fec86f6a9c4146eE(%"core::fmt::Arguments"* %_16, %"core::panic::location::Location"* align 8 bitcast (<{ i8*, [16 x i8] }>* @alloc176 to %"core::panic::location::Location"*)) #10
  unreachable

bb4:                                              ; preds = %bb3
  br label %bb12

bb10:                                             ; preds = %bb9
; call core::panicking::panic_fmt
  call void @_ZN4core9panicking9panic_fmt17h9fec86f6a9c4146eE(%"core::fmt::Arguments"* %_8, %"core::panic::location::Location"* align 8 bitcast (<{ i8*, [16 x i8] }>* @alloc178 to %"core::panic::location::Location"*)) #10
  unreachable

bb6:                                              ; preds = %bb5
  br label %bb12
}

; core::sync::atomic::atomic_store
; Function Attrs: inlinehint uwtable
define void @_ZN4core4sync6atomic12atomic_store17h11b93ef99081d6c8E(i8* %dst, i8 %val, i8 %0) unnamed_addr #0 {
start:
  %_20 = alloca %"core::fmt::Arguments", align 8
  %_12 = alloca %"core::fmt::Arguments", align 8
  %order = alloca i8, align 1
  store i8 %0, i8* %order, align 1
  %1 = load i8, i8* %order, align 1, !range !2, !noundef !1
  %_4 = zext i8 %1 to i64
  switch i64 %_4, label %bb2 [
    i64 0, label %bb5
    i64 1, label %bb3
    i64 2, label %bb9
    i64 3, label %bb1
    i64 4, label %bb7
  ]

bb2:                                              ; preds = %start
  unreachable

bb5:                                              ; preds = %start
  store atomic i8 %val, i8* %dst monotonic, align 1
  br label %bb6

bb3:                                              ; preds = %start
  store atomic i8 %val, i8* %dst release, align 1
  br label %bb4

bb9:                                              ; preds = %start
; call core::fmt::Arguments::new_v1
  call void @_ZN4core3fmt9Arguments6new_v117h5293e2b1d9130edfE(%"core::fmt::Arguments"* sret(%"core::fmt::Arguments") %_12, [0 x { [0 x i8]*, i64 }]* align 8 bitcast (<{ i8*, [8 x i8] }>* @alloc87 to [0 x { [0 x i8]*, i64 }]*), i64 1, [0 x { i8*, i64* }]* align 8 bitcast (<{}>* @alloc56 to [0 x { i8*, i64* }]*), i64 0)
  br label %bb10

bb1:                                              ; preds = %start
; call core::fmt::Arguments::new_v1
  call void @_ZN4core3fmt9Arguments6new_v117h5293e2b1d9130edfE(%"core::fmt::Arguments"* sret(%"core::fmt::Arguments") %_20, [0 x { [0 x i8]*, i64 }]* align 8 bitcast (<{ i8*, [8 x i8] }>* @alloc82 to [0 x { [0 x i8]*, i64 }]*), i64 1, [0 x { i8*, i64* }]* align 8 bitcast (<{}>* @alloc56 to [0 x { i8*, i64* }]*), i64 0)
  br label %bb11

bb7:                                              ; preds = %start
  store atomic i8 %val, i8* %dst seq_cst, align 1
  br label %bb8

bb8:                                              ; preds = %bb7
  br label %bb12

bb12:                                             ; preds = %bb6, %bb4, %bb8
  ret void

bb11:                                             ; preds = %bb1
; call core::panicking::panic_fmt
  call void @_ZN4core9panicking9panic_fmt17h9fec86f6a9c4146eE(%"core::fmt::Arguments"* %_20, %"core::panic::location::Location"* align 8 bitcast (<{ i8*, [16 x i8] }>* @alloc180 to %"core::panic::location::Location"*)) #10
  unreachable

bb10:                                             ; preds = %bb9
; call core::panicking::panic_fmt
  call void @_ZN4core9panicking9panic_fmt17h9fec86f6a9c4146eE(%"core::fmt::Arguments"* %_12, %"core::panic::location::Location"* align 8 bitcast (<{ i8*, [16 x i8] }>* @alloc182 to %"core::panic::location::Location"*)) #10
  unreachable

bb4:                                              ; preds = %bb3
  br label %bb12

bb6:                                              ; preds = %bb5
  br label %bb12
}

; core::sync::atomic::AtomicPtr<T>::compare_exchange
; Function Attrs: inlinehint uwtable
define { i64, i8* } @"_ZN4core4sync6atomic18AtomicPtr$LT$T$GT$16compare_exchange17h06337a85f292b96fE"(%"core::sync::atomic::AtomicPtr<std::sys::unix::locks::pthread_mutex::Mutex>"* align 8 %self, %"std::sys::unix::locks::pthread_mutex::Mutex"* %current, %"std::sys::unix::locks::pthread_mutex::Mutex"* %new, i8 %success, i8 %failure) unnamed_addr #0 {
start:
  %_7 = bitcast %"core::sync::atomic::AtomicPtr<std::sys::unix::locks::pthread_mutex::Mutex>"* %self to i64**
  %_2.i = bitcast i64** %_7 to %"std::sys::unix::locks::pthread_mutex::Mutex"**
  br label %bb1

bb1:                                              ; preds = %start
; call core::sync::atomic::atomic_compare_exchange
  %0 = call { i64, i8* } @_ZN4core4sync6atomic23atomic_compare_exchange17h5a3e7e4baf46337bE(%"std::sys::unix::locks::pthread_mutex::Mutex"** %_2.i, %"std::sys::unix::locks::pthread_mutex::Mutex"* %current, %"std::sys::unix::locks::pthread_mutex::Mutex"* %new, i8 %success, i8 %failure)
  %1 = extractvalue { i64, i8* } %0, 0
  %2 = extractvalue { i64, i8* } %0, 1
  br label %bb2

bb2:                                              ; preds = %bb1
  %3 = insertvalue { i64, i8* } undef, i64 %1, 0
  %4 = insertvalue { i64, i8* } %3, i8* %2, 1
  ret { i64, i8* } %4
}

; core::sync::atomic::AtomicPtr<T>::load
; Function Attrs: inlinehint uwtable
define %"std::sys::unix::locks::pthread_mutex::Mutex"* @"_ZN4core4sync6atomic18AtomicPtr$LT$T$GT$4load17h4bff9461efd5f8a4E"(%"core::sync::atomic::AtomicPtr<std::sys::unix::locks::pthread_mutex::Mutex>"* align 8 %self, i8 %order) unnamed_addr #0 {
start:
  %_5 = bitcast %"core::sync::atomic::AtomicPtr<std::sys::unix::locks::pthread_mutex::Mutex>"* %self to i64**
  %_2.i = bitcast i64** %_5 to %"std::sys::unix::locks::pthread_mutex::Mutex"**
  br label %bb1

bb1:                                              ; preds = %start
; call core::sync::atomic::atomic_load
  %0 = call %"std::sys::unix::locks::pthread_mutex::Mutex"* @_ZN4core4sync6atomic11atomic_load17hdd83247924c7fd51E(%"std::sys::unix::locks::pthread_mutex::Mutex"** %_2.i, i8 %order)
  br label %bb2

bb2:                                              ; preds = %bb1
  ret %"std::sys::unix::locks::pthread_mutex::Mutex"* %0
}

; core::sync::atomic::AtomicPtr<T>::get_mut
; Function Attrs: inlinehint uwtable
define align 8 %"std::sys::unix::locks::pthread_mutex::Mutex"** @"_ZN4core4sync6atomic18AtomicPtr$LT$T$GT$7get_mut17hf2e79c02ba9e8cdeE"(%"core::sync::atomic::AtomicPtr<std::sys::unix::locks::pthread_mutex::Mutex>"* align 8 %self) unnamed_addr #0 {
start:
  %_4 = bitcast %"core::sync::atomic::AtomicPtr<std::sys::unix::locks::pthread_mutex::Mutex>"* %self to i64**
  %_3.i = bitcast i64** %_4 to %"std::sys::unix::locks::pthread_mutex::Mutex"**
  br label %bb1

bb1:                                              ; preds = %start
  ret %"std::sys::unix::locks::pthread_mutex::Mutex"** %_3.i
}

; core::sync::atomic::atomic_compare_exchange
; Function Attrs: inlinehint uwtable
define { i64, i8* } @_ZN4core4sync6atomic23atomic_compare_exchange17h5a3e7e4baf46337bE(%"std::sys::unix::locks::pthread_mutex::Mutex"** %dst, %"std::sys::unix::locks::pthread_mutex::Mutex"* %old, %"std::sys::unix::locks::pthread_mutex::Mutex"* %new, i8 %success, i8 %failure) unnamed_addr #0 {
start:
  %_63 = alloca %"core::fmt::Arguments", align 8
  %_55 = alloca %"core::fmt::Arguments", align 8
  %_47 = alloca %"core::fmt::Arguments", align 8
  %_9 = alloca { i8, i8 }, align 1
  %_8 = alloca { i64*, i8 }, align 8
  %0 = alloca { i64, i8* }, align 8
  %1 = bitcast { i8, i8 }* %_9 to i8*
  store i8 %success, i8* %1, align 1
  %2 = getelementptr inbounds { i8, i8 }, { i8, i8 }* %_9, i32 0, i32 1
  store i8 %failure, i8* %2, align 1
  %3 = bitcast { i8, i8 }* %_9 to i8*
  %4 = load i8, i8* %3, align 1, !range !2, !noundef !1
  %_18 = zext i8 %4 to i64
  switch i64 %_18, label %bb35 [
    i64 0, label %bb1
    i64 1, label %bb3
    i64 2, label %bb4
    i64 3, label %bb5
    i64 4, label %bb6
  ]

bb35:                                             ; preds = %start
  unreachable

bb1:                                              ; preds = %start
  %5 = getelementptr inbounds { i8, i8 }, { i8, i8 }* %_9, i32 0, i32 1
  %6 = load i8, i8* %5, align 1, !range !2, !noundef !1
  %_12 = zext i8 %6 to i64
  %7 = icmp eq i64 %_12, 0
  br i1 %7, label %bb14, label %bb2

bb3:                                              ; preds = %start
  %8 = getelementptr inbounds { i8, i8 }, { i8, i8 }* %_9, i32 0, i32 1
  %9 = load i8, i8* %8, align 1, !range !2, !noundef !1
  %_13 = zext i8 %9 to i64
  %10 = icmp eq i64 %_13, 0
  br i1 %10, label %bb10, label %bb2

bb4:                                              ; preds = %start
  %11 = getelementptr inbounds { i8, i8 }, { i8, i8 }* %_9, i32 0, i32 1
  %12 = load i8, i8* %11, align 1, !range !2, !noundef !1
  %_14 = zext i8 %12 to i64
  switch i64 %_14, label %bb2 [
    i64 0, label %bb18
    i64 2, label %bb8
  ]

bb5:                                              ; preds = %start
  %13 = getelementptr inbounds { i8, i8 }, { i8, i8 }* %_9, i32 0, i32 1
  %14 = load i8, i8* %13, align 1, !range !2, !noundef !1
  %_15 = zext i8 %14 to i64
  switch i64 %_15, label %bb2 [
    i64 0, label %bb20
    i64 2, label %bb12
  ]

bb6:                                              ; preds = %start
  %15 = getelementptr inbounds { i8, i8 }, { i8, i8 }* %_9, i32 0, i32 1
  %16 = load i8, i8* %15, align 1, !range !2, !noundef !1
  %_16 = zext i8 %16 to i64
  switch i64 %_16, label %bb2 [
    i64 0, label %bb22
    i64 2, label %bb24
    i64 4, label %bb16
  ]

bb2:                                              ; preds = %bb1, %bb3, %bb4, %bb5, %bb6
  %17 = getelementptr inbounds { i8, i8 }, { i8, i8 }* %_9, i32 0, i32 1
  %18 = load i8, i8* %17, align 1, !range !2, !noundef !1
  %_17 = zext i8 %18 to i64
  switch i64 %_17, label %bb7 [
    i64 1, label %bb28
    i64 3, label %bb26
  ]

bb22:                                             ; preds = %bb6
  %19 = bitcast %"std::sys::unix::locks::pthread_mutex::Mutex"** %dst to i64*
  %20 = ptrtoint %"std::sys::unix::locks::pthread_mutex::Mutex"* %old to i64
  %21 = ptrtoint %"std::sys::unix::locks::pthread_mutex::Mutex"* %new to i64
  %22 = cmpxchg i64* %19, i64 %20, i64 %21 seq_cst monotonic, align 8
  %23 = extractvalue { i64, i1 } %22, 0
  %24 = extractvalue { i64, i1 } %22, 1
  %25 = zext i1 %24 to i8
  %26 = bitcast { i64*, i8 }* %_8 to %"std::sys::unix::locks::pthread_mutex::Mutex"**
  %27 = bitcast %"std::sys::unix::locks::pthread_mutex::Mutex"** %26 to i64*
  store i64 %23, i64* %27, align 8
  %28 = getelementptr inbounds { i64*, i8 }, { i64*, i8 }* %_8, i32 0, i32 1
  store i8 %25, i8* %28, align 8
  br label %bb23

bb24:                                             ; preds = %bb6
  %29 = bitcast %"std::sys::unix::locks::pthread_mutex::Mutex"** %dst to i64*
  %30 = ptrtoint %"std::sys::unix::locks::pthread_mutex::Mutex"* %old to i64
  %31 = ptrtoint %"std::sys::unix::locks::pthread_mutex::Mutex"* %new to i64
  %32 = cmpxchg i64* %29, i64 %30, i64 %31 seq_cst acquire, align 8
  %33 = extractvalue { i64, i1 } %32, 0
  %34 = extractvalue { i64, i1 } %32, 1
  %35 = zext i1 %34 to i8
  %36 = bitcast { i64*, i8 }* %_8 to %"std::sys::unix::locks::pthread_mutex::Mutex"**
  %37 = bitcast %"std::sys::unix::locks::pthread_mutex::Mutex"** %36 to i64*
  store i64 %33, i64* %37, align 8
  %38 = getelementptr inbounds { i64*, i8 }, { i64*, i8 }* %_8, i32 0, i32 1
  store i8 %35, i8* %38, align 8
  br label %bb25

bb16:                                             ; preds = %bb6
  %39 = bitcast %"std::sys::unix::locks::pthread_mutex::Mutex"** %dst to i64*
  %40 = ptrtoint %"std::sys::unix::locks::pthread_mutex::Mutex"* %old to i64
  %41 = ptrtoint %"std::sys::unix::locks::pthread_mutex::Mutex"* %new to i64
  %42 = cmpxchg i64* %39, i64 %40, i64 %41 seq_cst seq_cst, align 8
  %43 = extractvalue { i64, i1 } %42, 0
  %44 = extractvalue { i64, i1 } %42, 1
  %45 = zext i1 %44 to i8
  %46 = bitcast { i64*, i8 }* %_8 to %"std::sys::unix::locks::pthread_mutex::Mutex"**
  %47 = bitcast %"std::sys::unix::locks::pthread_mutex::Mutex"** %46 to i64*
  store i64 %43, i64* %47, align 8
  %48 = getelementptr inbounds { i64*, i8 }, { i64*, i8 }* %_8, i32 0, i32 1
  store i8 %45, i8* %48, align 8
  br label %bb17

bb17:                                             ; preds = %bb16
  br label %bb31

bb31:                                             ; preds = %bb15, %bb11, %bb19, %bb9, %bb21, %bb13, %bb23, %bb25, %bb17
  %49 = bitcast { i64*, i8 }* %_8 to %"std::sys::unix::locks::pthread_mutex::Mutex"**
  %val = load %"std::sys::unix::locks::pthread_mutex::Mutex"*, %"std::sys::unix::locks::pthread_mutex::Mutex"** %49, align 8
  %50 = getelementptr inbounds { i64*, i8 }, { i64*, i8 }* %_8, i32 0, i32 1
  %51 = load i8, i8* %50, align 8, !range !5, !noundef !1
  %ok = trunc i8 %51 to i1
  br i1 %ok, label %bb32, label %bb33

bb25:                                             ; preds = %bb24
  br label %bb31

bb23:                                             ; preds = %bb22
  br label %bb31

bb20:                                             ; preds = %bb5
  %52 = bitcast %"std::sys::unix::locks::pthread_mutex::Mutex"** %dst to i64*
  %53 = ptrtoint %"std::sys::unix::locks::pthread_mutex::Mutex"* %old to i64
  %54 = ptrtoint %"std::sys::unix::locks::pthread_mutex::Mutex"* %new to i64
  %55 = cmpxchg i64* %52, i64 %53, i64 %54 acq_rel monotonic, align 8
  %56 = extractvalue { i64, i1 } %55, 0
  %57 = extractvalue { i64, i1 } %55, 1
  %58 = zext i1 %57 to i8
  %59 = bitcast { i64*, i8 }* %_8 to %"std::sys::unix::locks::pthread_mutex::Mutex"**
  %60 = bitcast %"std::sys::unix::locks::pthread_mutex::Mutex"** %59 to i64*
  store i64 %56, i64* %60, align 8
  %61 = getelementptr inbounds { i64*, i8 }, { i64*, i8 }* %_8, i32 0, i32 1
  store i8 %58, i8* %61, align 8
  br label %bb21

bb12:                                             ; preds = %bb5
  %62 = bitcast %"std::sys::unix::locks::pthread_mutex::Mutex"** %dst to i64*
  %63 = ptrtoint %"std::sys::unix::locks::pthread_mutex::Mutex"* %old to i64
  %64 = ptrtoint %"std::sys::unix::locks::pthread_mutex::Mutex"* %new to i64
  %65 = cmpxchg i64* %62, i64 %63, i64 %64 acq_rel acquire, align 8
  %66 = extractvalue { i64, i1 } %65, 0
  %67 = extractvalue { i64, i1 } %65, 1
  %68 = zext i1 %67 to i8
  %69 = bitcast { i64*, i8 }* %_8 to %"std::sys::unix::locks::pthread_mutex::Mutex"**
  %70 = bitcast %"std::sys::unix::locks::pthread_mutex::Mutex"** %69 to i64*
  store i64 %66, i64* %70, align 8
  %71 = getelementptr inbounds { i64*, i8 }, { i64*, i8 }* %_8, i32 0, i32 1
  store i8 %68, i8* %71, align 8
  br label %bb13

bb13:                                             ; preds = %bb12
  br label %bb31

bb21:                                             ; preds = %bb20
  br label %bb31

bb18:                                             ; preds = %bb4
  %72 = bitcast %"std::sys::unix::locks::pthread_mutex::Mutex"** %dst to i64*
  %73 = ptrtoint %"std::sys::unix::locks::pthread_mutex::Mutex"* %old to i64
  %74 = ptrtoint %"std::sys::unix::locks::pthread_mutex::Mutex"* %new to i64
  %75 = cmpxchg i64* %72, i64 %73, i64 %74 acquire monotonic, align 8
  %76 = extractvalue { i64, i1 } %75, 0
  %77 = extractvalue { i64, i1 } %75, 1
  %78 = zext i1 %77 to i8
  %79 = bitcast { i64*, i8 }* %_8 to %"std::sys::unix::locks::pthread_mutex::Mutex"**
  %80 = bitcast %"std::sys::unix::locks::pthread_mutex::Mutex"** %79 to i64*
  store i64 %76, i64* %80, align 8
  %81 = getelementptr inbounds { i64*, i8 }, { i64*, i8 }* %_8, i32 0, i32 1
  store i8 %78, i8* %81, align 8
  br label %bb19

bb8:                                              ; preds = %bb4
  %82 = bitcast %"std::sys::unix::locks::pthread_mutex::Mutex"** %dst to i64*
  %83 = ptrtoint %"std::sys::unix::locks::pthread_mutex::Mutex"* %old to i64
  %84 = ptrtoint %"std::sys::unix::locks::pthread_mutex::Mutex"* %new to i64
  %85 = cmpxchg i64* %82, i64 %83, i64 %84 acquire acquire, align 8
  %86 = extractvalue { i64, i1 } %85, 0
  %87 = extractvalue { i64, i1 } %85, 1
  %88 = zext i1 %87 to i8
  %89 = bitcast { i64*, i8 }* %_8 to %"std::sys::unix::locks::pthread_mutex::Mutex"**
  %90 = bitcast %"std::sys::unix::locks::pthread_mutex::Mutex"** %89 to i64*
  store i64 %86, i64* %90, align 8
  %91 = getelementptr inbounds { i64*, i8 }, { i64*, i8 }* %_8, i32 0, i32 1
  store i8 %88, i8* %91, align 8
  br label %bb9

bb9:                                              ; preds = %bb8
  br label %bb31

bb19:                                             ; preds = %bb18
  br label %bb31

bb10:                                             ; preds = %bb3
  %92 = bitcast %"std::sys::unix::locks::pthread_mutex::Mutex"** %dst to i64*
  %93 = ptrtoint %"std::sys::unix::locks::pthread_mutex::Mutex"* %old to i64
  %94 = ptrtoint %"std::sys::unix::locks::pthread_mutex::Mutex"* %new to i64
  %95 = cmpxchg i64* %92, i64 %93, i64 %94 release monotonic, align 8
  %96 = extractvalue { i64, i1 } %95, 0
  %97 = extractvalue { i64, i1 } %95, 1
  %98 = zext i1 %97 to i8
  %99 = bitcast { i64*, i8 }* %_8 to %"std::sys::unix::locks::pthread_mutex::Mutex"**
  %100 = bitcast %"std::sys::unix::locks::pthread_mutex::Mutex"** %99 to i64*
  store i64 %96, i64* %100, align 8
  %101 = getelementptr inbounds { i64*, i8 }, { i64*, i8 }* %_8, i32 0, i32 1
  store i8 %98, i8* %101, align 8
  br label %bb11

bb11:                                             ; preds = %bb10
  br label %bb31

bb14:                                             ; preds = %bb1
  %102 = bitcast %"std::sys::unix::locks::pthread_mutex::Mutex"** %dst to i64*
  %103 = ptrtoint %"std::sys::unix::locks::pthread_mutex::Mutex"* %old to i64
  %104 = ptrtoint %"std::sys::unix::locks::pthread_mutex::Mutex"* %new to i64
  %105 = cmpxchg i64* %102, i64 %103, i64 %104 monotonic monotonic, align 8
  %106 = extractvalue { i64, i1 } %105, 0
  %107 = extractvalue { i64, i1 } %105, 1
  %108 = zext i1 %107 to i8
  %109 = bitcast { i64*, i8 }* %_8 to %"std::sys::unix::locks::pthread_mutex::Mutex"**
  %110 = bitcast %"std::sys::unix::locks::pthread_mutex::Mutex"** %109 to i64*
  store i64 %106, i64* %110, align 8
  %111 = getelementptr inbounds { i64*, i8 }, { i64*, i8 }* %_8, i32 0, i32 1
  store i8 %108, i8* %111, align 8
  br label %bb15

bb7:                                              ; preds = %bb2
; call core::fmt::Arguments::new_v1
  call void @_ZN4core3fmt9Arguments6new_v117h5293e2b1d9130edfE(%"core::fmt::Arguments"* sret(%"core::fmt::Arguments") %_63, [0 x { [0 x i8]*, i64 }]* align 8 bitcast (<{ i8*, [8 x i8] }>* @alloc44 to [0 x { [0 x i8]*, i64 }]*), i64 1, [0 x { i8*, i64* }]* align 8 bitcast (<{}>* @alloc56 to [0 x { i8*, i64* }]*), i64 0)
  br label %bb30

bb28:                                             ; preds = %bb2
; call core::fmt::Arguments::new_v1
  call void @_ZN4core3fmt9Arguments6new_v117h5293e2b1d9130edfE(%"core::fmt::Arguments"* sret(%"core::fmt::Arguments") %_55, [0 x { [0 x i8]*, i64 }]* align 8 bitcast (<{ i8*, [8 x i8] }>* @alloc54 to [0 x { [0 x i8]*, i64 }]*), i64 1, [0 x { i8*, i64* }]* align 8 bitcast (<{}>* @alloc56 to [0 x { i8*, i64* }]*), i64 0)
  br label %bb29

bb26:                                             ; preds = %bb2
; call core::fmt::Arguments::new_v1
  call void @_ZN4core3fmt9Arguments6new_v117h5293e2b1d9130edfE(%"core::fmt::Arguments"* sret(%"core::fmt::Arguments") %_47, [0 x { [0 x i8]*, i64 }]* align 8 bitcast (<{ i8*, [8 x i8] }>* @alloc49 to [0 x { [0 x i8]*, i64 }]*), i64 1, [0 x { i8*, i64* }]* align 8 bitcast (<{}>* @alloc56 to [0 x { i8*, i64* }]*), i64 0)
  br label %bb27

bb30:                                             ; preds = %bb7
; call core::panicking::panic_fmt
  call void @_ZN4core9panicking9panic_fmt17h9fec86f6a9c4146eE(%"core::fmt::Arguments"* %_63, %"core::panic::location::Location"* align 8 bitcast (<{ i8*, [16 x i8] }>* @alloc184 to %"core::panic::location::Location"*)) #10
  unreachable

bb27:                                             ; preds = %bb26
; call core::panicking::panic_fmt
  call void @_ZN4core9panicking9panic_fmt17h9fec86f6a9c4146eE(%"core::fmt::Arguments"* %_47, %"core::panic::location::Location"* align 8 bitcast (<{ i8*, [16 x i8] }>* @alloc186 to %"core::panic::location::Location"*)) #10
  unreachable

bb29:                                             ; preds = %bb28
; call core::panicking::panic_fmt
  call void @_ZN4core9panicking9panic_fmt17h9fec86f6a9c4146eE(%"core::fmt::Arguments"* %_55, %"core::panic::location::Location"* align 8 bitcast (<{ i8*, [16 x i8] }>* @alloc188 to %"core::panic::location::Location"*)) #10
  unreachable

bb15:                                             ; preds = %bb14
  br label %bb31

bb33:                                             ; preds = %bb31
  %112 = getelementptr inbounds { i64, i8* }, { i64, i8* }* %0, i32 0, i32 1
  %113 = bitcast i8** %112 to %"std::sys::unix::locks::pthread_mutex::Mutex"**
  store %"std::sys::unix::locks::pthread_mutex::Mutex"* %val, %"std::sys::unix::locks::pthread_mutex::Mutex"** %113, align 8
  %114 = bitcast { i64, i8* }* %0 to i64*
  store i64 1, i64* %114, align 8
  br label %bb34

bb32:                                             ; preds = %bb31
  %115 = getelementptr inbounds { i64, i8* }, { i64, i8* }* %0, i32 0, i32 1
  %116 = bitcast i8** %115 to %"std::sys::unix::locks::pthread_mutex::Mutex"**
  store %"std::sys::unix::locks::pthread_mutex::Mutex"* %val, %"std::sys::unix::locks::pthread_mutex::Mutex"** %116, align 8
  %117 = bitcast { i64, i8* }* %0 to i64*
  store i64 0, i64* %117, align 8
  br label %bb34

bb34:                                             ; preds = %bb33, %bb32
  %118 = getelementptr inbounds { i64, i8* }, { i64, i8* }* %0, i32 0, i32 0
  %119 = load i64, i64* %118, align 8, !range !3, !noundef !1
  %120 = getelementptr inbounds { i64, i8* }, { i64, i8* }* %0, i32 0, i32 1
  %121 = load i8*, i8** %120, align 8
  %122 = insertvalue { i64, i8* } undef, i64 %119, 0
  %123 = insertvalue { i64, i8* } %122, i8* %121, 1
  ret { i64, i8* } %123
}

; core::alloc::layout::Layout::from_size_align_unchecked
; Function Attrs: inlinehint uwtable
define internal { i64, i64 } @_ZN4core5alloc6layout6Layout25from_size_align_unchecked17h44e2a52304be60bcE(i64 %size, i64 %align) unnamed_addr #0 {
start:
  %0 = alloca { i64, i64 }, align 8
; call core::mem::valid_align::ValidAlign::new_unchecked
  %_4 = call i64 @_ZN4core3mem11valid_align10ValidAlign13new_unchecked17h24ea801e8192e25dE(i64 %align), !range !7
  br label %bb1

bb1:                                              ; preds = %start
  %1 = bitcast { i64, i64 }* %0 to i64*
  store i64 %size, i64* %1, align 8
  %2 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %0, i32 0, i32 1
  store i64 %_4, i64* %2, align 8
  %3 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %0, i32 0, i32 0
  %4 = load i64, i64* %3, align 8
  %5 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %0, i32 0, i32 1
  %6 = load i64, i64* %5, align 8, !range !7, !noundef !1
  %7 = insertvalue { i64, i64 } undef, i64 %4, 0
  %8 = insertvalue { i64, i64 } %7, i64 %6, 1
  ret { i64, i64 } %8
}

; core::alloc::layout::Layout::size
; Function Attrs: inlinehint uwtable
define internal i64 @_ZN4core5alloc6layout6Layout4size17h5f7d8cb46f847c96E({ i64, i64 }* align 8 %self) unnamed_addr #0 {
start:
  %0 = bitcast { i64, i64 }* %self to i64*
  %1 = load i64, i64* %0, align 8
  ret i64 %1
}

; core::alloc::layout::Layout::align
; Function Attrs: inlinehint uwtable
define internal i64 @_ZN4core5alloc6layout6Layout5align17h6b690fe3e95b8ba9E({ i64, i64 }* align 8 %self) unnamed_addr #0 {
start:
  %0 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %self, i32 0, i32 1
  %_3 = load i64, i64* %0, align 8, !range !7, !noundef !1
; call core::mem::valid_align::ValidAlign::as_nonzero
  %_2 = call i64 @_ZN4core3mem11valid_align10ValidAlign10as_nonzero17hfa17014517a3b97eE(i64 %_3), !range !6
  br label %bb1

bb1:                                              ; preds = %start
; call core::num::nonzero::NonZeroUsize::get
  %1 = call i64 @_ZN4core3num7nonzero12NonZeroUsize3get17ha400b61e506565cfE(i64 %_2)
  br label %bb2

bb2:                                              ; preds = %bb1
  ret i64 %1
}

; core::result::Result<T,E>::unwrap
; Function Attrs: inlinehint uwtable
define { i64*, i8 } @"_ZN4core6result19Result$LT$T$C$E$GT$6unwrap17h59508c3fa5ee950cE"(%"core::result::Result<std::sync::mutex::MutexGuard<i32>, std::sync::poison::PoisonError<std::sync::mutex::MutexGuard<i32>>>"* %self, %"core::panic::location::Location"* align 8 %0) unnamed_addr #0 personality i32 (i32, i32, i64, %"unwind::libunwind::_Unwind_Exception"*, %"unwind::libunwind::_Unwind_Context"*)* @rust_eh_personality {
start:
  %1 = alloca { i8*, i32 }, align 8
  %e = alloca { i64*, i8 }, align 8
  %2 = bitcast %"core::result::Result<std::sync::mutex::MutexGuard<i32>, std::sync::poison::PoisonError<std::sync::mutex::MutexGuard<i32>>>"* %self to i64*
  %_2 = load i64, i64* %2, align 8, !range !3, !noundef !1
  switch i64 %_2, label %bb2 [
    i64 0, label %bb3
    i64 1, label %bb1
  ]

bb2:                                              ; preds = %start
  unreachable

bb3:                                              ; preds = %start
  %3 = bitcast %"core::result::Result<std::sync::mutex::MutexGuard<i32>, std::sync::poison::PoisonError<std::sync::mutex::MutexGuard<i32>>>"* %self to %"core::result::Result<std::sync::mutex::MutexGuard<i32>, std::sync::poison::PoisonError<std::sync::mutex::MutexGuard<i32>>>::Ok"*
  %4 = getelementptr inbounds %"core::result::Result<std::sync::mutex::MutexGuard<i32>, std::sync::poison::PoisonError<std::sync::mutex::MutexGuard<i32>>>::Ok", %"core::result::Result<std::sync::mutex::MutexGuard<i32>, std::sync::poison::PoisonError<std::sync::mutex::MutexGuard<i32>>>::Ok"* %3, i32 0, i32 1
  %5 = getelementptr inbounds { i64*, i8 }, { i64*, i8 }* %4, i32 0, i32 0
  %t.0 = load i64*, i64** %5, align 8, !nonnull !1, !align !4, !noundef !1
  %6 = getelementptr inbounds { i64*, i8 }, { i64*, i8 }* %4, i32 0, i32 1
  %7 = load i8, i8* %6, align 8, !range !5, !noundef !1
  %t.1 = trunc i8 %7 to i1
  %8 = zext i1 %t.1 to i8
  %9 = insertvalue { i64*, i8 } undef, i64* %t.0, 0
  %10 = insertvalue { i64*, i8 } %9, i8 %8, 1
  ret { i64*, i8 } %10

bb1:                                              ; preds = %start
  %11 = bitcast %"core::result::Result<std::sync::mutex::MutexGuard<i32>, std::sync::poison::PoisonError<std::sync::mutex::MutexGuard<i32>>>"* %self to %"core::result::Result<std::sync::mutex::MutexGuard<i32>, std::sync::poison::PoisonError<std::sync::mutex::MutexGuard<i32>>>::Err"*
  %12 = getelementptr inbounds %"core::result::Result<std::sync::mutex::MutexGuard<i32>, std::sync::poison::PoisonError<std::sync::mutex::MutexGuard<i32>>>::Err", %"core::result::Result<std::sync::mutex::MutexGuard<i32>, std::sync::poison::PoisonError<std::sync::mutex::MutexGuard<i32>>>::Err"* %11, i32 0, i32 1
  %13 = getelementptr inbounds { i64*, i8 }, { i64*, i8 }* %12, i32 0, i32 0
  %14 = load i64*, i64** %13, align 8, !nonnull !1, !align !4, !noundef !1
  %15 = getelementptr inbounds { i64*, i8 }, { i64*, i8 }* %12, i32 0, i32 1
  %16 = load i8, i8* %15, align 8, !range !5, !noundef !1
  %17 = trunc i8 %16 to i1
  %18 = getelementptr inbounds { i64*, i8 }, { i64*, i8 }* %e, i32 0, i32 0
  store i64* %14, i64** %18, align 8
  %19 = getelementptr inbounds { i64*, i8 }, { i64*, i8 }* %e, i32 0, i32 1
  %20 = zext i1 %17 to i8
  store i8 %20, i8* %19, align 8
  %_7.0 = bitcast { i64*, i8 }* %e to {}*
; invoke core::result::unwrap_failed
  invoke void @_ZN4core6result13unwrap_failed17h04f08301b97a771cE([0 x i8]* align 1 bitcast (<{ [43 x i8] }>* @alloc189 to [0 x i8]*), i64 43, {}* align 1 %_7.0, [3 x i64]* align 8 bitcast (<{ i8*, [16 x i8], i8* }>* @vtable.0 to [3 x i64]*), %"core::panic::location::Location"* align 8 %0) #10
          to label %unreachable unwind label %cleanup

bb4:                                              ; preds = %cleanup
; invoke core::ptr::drop_in_place<std::sync::poison::PoisonError<std::sync::mutex::MutexGuard<i32>>>
  invoke void @"_ZN4core3ptr98drop_in_place$LT$std..sync..poison..PoisonError$LT$std..sync..mutex..MutexGuard$LT$i32$GT$$GT$$GT$17h3b12ccb00e013112E"({ i64*, i8 }* %e) #11
          to label %bb5 unwind label %abort

cleanup:                                          ; preds = %bb1
  %21 = landingpad { i8*, i32 }
          cleanup
  %22 = extractvalue { i8*, i32 } %21, 0
  %23 = extractvalue { i8*, i32 } %21, 1
  %24 = getelementptr inbounds { i8*, i32 }, { i8*, i32 }* %1, i32 0, i32 0
  store i8* %22, i8** %24, align 8
  %25 = getelementptr inbounds { i8*, i32 }, { i8*, i32 }* %1, i32 0, i32 1
  store i32 %23, i32* %25, align 8
  br label %bb4

unreachable:                                      ; preds = %bb1
  unreachable

abort:                                            ; preds = %bb4
  %26 = landingpad { i8*, i32 }
          cleanup
; call core::panicking::panic_no_unwind
  call void @_ZN4core9panicking15panic_no_unwind17hfdf5806230424742E() #12
  unreachable

bb5:                                              ; preds = %bb4
  %27 = bitcast { i8*, i32 }* %1 to i8**
  %28 = load i8*, i8** %27, align 8
  %29 = getelementptr inbounds { i8*, i32 }, { i8*, i32 }* %1, i32 0, i32 1
  %30 = load i32, i32* %29, align 8
  %31 = insertvalue { i8*, i32 } undef, i8* %28, 0
  %32 = insertvalue { i8*, i32 } %31, i32 %30, 1
  resume { i8*, i32 } %32
}

; alloc::alloc::dealloc
; Function Attrs: inlinehint uwtable
define internal void @_ZN5alloc5alloc7dealloc17h06cffeeba27255afE(i8* %ptr, i64 %0, i64 %1) unnamed_addr #0 {
start:
  %layout = alloca { i64, i64 }, align 8
  %2 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %layout, i32 0, i32 0
  store i64 %0, i64* %2, align 8
  %3 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %layout, i32 0, i32 1
  store i64 %1, i64* %3, align 8
; call core::alloc::layout::Layout::size
  %_4 = call i64 @_ZN4core5alloc6layout6Layout4size17h5f7d8cb46f847c96E({ i64, i64 }* align 8 %layout)
  br label %bb1

bb1:                                              ; preds = %start
; call core::alloc::layout::Layout::align
  %_6 = call i64 @_ZN4core5alloc6layout6Layout5align17h6b690fe3e95b8ba9E({ i64, i64 }* align 8 %layout)
  br label %bb2

bb2:                                              ; preds = %bb1
  call void @__rust_dealloc(i8* %ptr, i64 %_4, i64 %_6) #13
  br label %bb3

bb3:                                              ; preds = %bb2
  ret void
}

; alloc::alloc::box_free
; Function Attrs: inlinehint uwtable
define void @_ZN5alloc5alloc8box_free17h9974f85a1dcd1780E(i64* %0) unnamed_addr #0 personality i32 (i32, i32, i64, %"unwind::libunwind::_Unwind_Exception"*, %"unwind::libunwind::_Unwind_Context"*)* @rust_eh_personality {
start:
  %1 = alloca i64, align 8
  %2 = alloca i64, align 8
  %3 = alloca { i8*, i32 }, align 8
  %alloc = alloca %"alloc::alloc::Global", align 1
  %ptr = alloca i64*, align 8
  store i64* %0, i64** %ptr, align 8
; invoke core::ptr::unique::Unique<T>::as_ref
  %_5 = invoke align 8 %"std::sys::unix::locks::pthread_mutex::Mutex"* @"_ZN4core3ptr6unique15Unique$LT$T$GT$6as_ref17h63a05b0955c85c23E"(i64** align 8 %ptr)
          to label %bb1 unwind label %cleanup

bb10:                                             ; preds = %cleanup
  br label %bb11

cleanup:                                          ; preds = %bb7, %bb6, %bb5, %bb4, %bb2, %start
  %4 = landingpad { i8*, i32 }
          cleanup
  %5 = extractvalue { i8*, i32 } %4, 0
  %6 = extractvalue { i8*, i32 } %4, 1
  %7 = getelementptr inbounds { i8*, i32 }, { i8*, i32 }* %3, i32 0, i32 0
  store i8* %5, i8** %7, align 8
  %8 = getelementptr inbounds { i8*, i32 }, { i8*, i32 }* %3, i32 0, i32 1
  store i32 %6, i32* %8, align 8
  br label %bb10

bb1:                                              ; preds = %start
  store i64 64, i64* %2, align 8
  %size = load i64, i64* %2, align 8
  br label %bb2

bb2:                                              ; preds = %bb1
; invoke core::ptr::unique::Unique<T>::as_ref
  %_9 = invoke align 8 %"std::sys::unix::locks::pthread_mutex::Mutex"* @"_ZN4core3ptr6unique15Unique$LT$T$GT$6as_ref17h63a05b0955c85c23E"(i64** align 8 %ptr)
          to label %bb3 unwind label %cleanup

bb3:                                              ; preds = %bb2
  store i64 8, i64* %1, align 8
  %align = load i64, i64* %1, align 8
  br label %bb4

bb4:                                              ; preds = %bb3
; invoke core::alloc::layout::Layout::from_size_align_unchecked
  %9 = invoke { i64, i64 } @_ZN4core5alloc6layout6Layout25from_size_align_unchecked17h44e2a52304be60bcE(i64 %size, i64 %align)
          to label %bb5 unwind label %cleanup

bb5:                                              ; preds = %bb4
  %layout.0 = extractvalue { i64, i64 } %9, 0
  %layout.1 = extractvalue { i64, i64 } %9, 1
  %_17 = load i64*, i64** %ptr, align 8, !nonnull !1, !noundef !1
; invoke core::ptr::unique::Unique<T>::cast
  %_16 = invoke i8* @"_ZN4core3ptr6unique15Unique$LT$T$GT$4cast17hf053bf66ea7f63f9E"(i64* %_17)
          to label %bb6 unwind label %cleanup

bb6:                                              ; preds = %bb5
; invoke <core::ptr::non_null::NonNull<T> as core::convert::From<core::ptr::unique::Unique<T>>>::from
  %_15 = invoke i8* @"_ZN119_$LT$core..ptr..non_null..NonNull$LT$T$GT$$u20$as$u20$core..convert..From$LT$core..ptr..unique..Unique$LT$T$GT$$GT$$GT$4from17h560f851b15f802e4E"(i8* %_16)
          to label %bb7 unwind label %cleanup

bb7:                                              ; preds = %bb6
; invoke <alloc::alloc::Global as core::alloc::Allocator>::deallocate
  invoke void @"_ZN63_$LT$alloc..alloc..Global$u20$as$u20$core..alloc..Allocator$GT$10deallocate17h064aee16052bfe66E"(%"alloc::alloc::Global"* align 1 %alloc, i8* %_15, i64 %layout.0, i64 %layout.1)
          to label %bb8 unwind label %cleanup

bb8:                                              ; preds = %bb7
  br label %bb9

bb11:                                             ; preds = %bb10
  %10 = bitcast { i8*, i32 }* %3 to i8**
  %11 = load i8*, i8** %10, align 8
  %12 = getelementptr inbounds { i8*, i32 }, { i8*, i32 }* %3, i32 0, i32 1
  %13 = load i32, i32* %12, align 8
  %14 = insertvalue { i8*, i32 } undef, i8* %11, 0
  %15 = insertvalue { i8*, i32 } %14, i32 %13, 1
  resume { i8*, i32 } %15

bb9:                                              ; preds = %bb8
  ret void
}

; alloc::boxed::Box<T>::from_raw
; Function Attrs: inlinehint uwtable
define align 8 %"std::sys::unix::locks::pthread_mutex::Mutex"* @"_ZN5alloc5boxed12Box$LT$T$GT$8from_raw17h9016c750bf2f2bbdE"(%"std::sys::unix::locks::pthread_mutex::Mutex"* %raw) unnamed_addr #0 {
start:
; call alloc::boxed::Box<T,A>::from_raw_in
  %0 = call align 8 %"std::sys::unix::locks::pthread_mutex::Mutex"* @"_ZN5alloc5boxed16Box$LT$T$C$A$GT$11from_raw_in17hf95ac10f08407803E"(%"std::sys::unix::locks::pthread_mutex::Mutex"* %raw)
  br label %bb1

bb1:                                              ; preds = %start
  ret %"std::sys::unix::locks::pthread_mutex::Mutex"* %0
}

; alloc::boxed::Box<T,A>::from_raw_in
; Function Attrs: inlinehint uwtable
define align 8 %"std::sys::unix::locks::pthread_mutex::Mutex"* @"_ZN5alloc5boxed16Box$LT$T$C$A$GT$11from_raw_in17hf95ac10f08407803E"(%"std::sys::unix::locks::pthread_mutex::Mutex"* %raw) unnamed_addr #0 personality i32 (i32, i32, i64, %"unwind::libunwind::_Unwind_Exception"*, %"unwind::libunwind::_Unwind_Context"*)* @rust_eh_personality {
start:
  %0 = alloca { i8*, i32 }, align 8
  %1 = alloca %"std::sys::unix::locks::pthread_mutex::Mutex"*, align 8
; invoke core::ptr::unique::Unique<T>::new_unchecked
  %_3 = invoke i64* @"_ZN4core3ptr6unique15Unique$LT$T$GT$13new_unchecked17h7c7f45e4a5387838E"(%"std::sys::unix::locks::pthread_mutex::Mutex"* %raw)
          to label %bb1 unwind label %cleanup

bb2:                                              ; preds = %cleanup
  br label %bb3

cleanup:                                          ; preds = %start
  %2 = landingpad { i8*, i32 }
          cleanup
  %3 = extractvalue { i8*, i32 } %2, 0
  %4 = extractvalue { i8*, i32 } %2, 1
  %5 = getelementptr inbounds { i8*, i32 }, { i8*, i32 }* %0, i32 0, i32 0
  store i8* %3, i8** %5, align 8
  %6 = getelementptr inbounds { i8*, i32 }, { i8*, i32 }* %0, i32 0, i32 1
  store i32 %4, i32* %6, align 8
  br label %bb2

bb1:                                              ; preds = %start
  %7 = bitcast %"std::sys::unix::locks::pthread_mutex::Mutex"** %1 to i64**
  store i64* %_3, i64** %7, align 8
  %8 = bitcast %"std::sys::unix::locks::pthread_mutex::Mutex"** %1 to %"alloc::alloc::Global"*
  %9 = load %"std::sys::unix::locks::pthread_mutex::Mutex"*, %"std::sys::unix::locks::pthread_mutex::Mutex"** %1, align 8, !nonnull !1, !align !4, !noundef !1
  ret %"std::sys::unix::locks::pthread_mutex::Mutex"* %9

bb3:                                              ; preds = %bb2
  %10 = bitcast { i8*, i32 }* %0 to i8**
  %11 = load i8*, i8** %10, align 8
  %12 = getelementptr inbounds { i8*, i32 }, { i8*, i32 }* %0, i32 0, i32 1
  %13 = load i32, i32* %12, align 8
  %14 = insertvalue { i8*, i32 } undef, i8* %11, 0
  %15 = insertvalue { i8*, i32 } %14, i32 %13, 1
  resume { i8*, i32 } %15
}

; alloc::boxed::Box<T,A>::into_unique
; Function Attrs: inlinehint uwtable
define i64* @"_ZN5alloc5boxed16Box$LT$T$C$A$GT$11into_unique17hbbb538fa69289050E"(%"std::sys::unix::locks::pthread_mutex::Mutex"* align 8 %0) unnamed_addr #0 personality i32 (i32, i32, i64, %"unwind::libunwind::_Unwind_Exception"*, %"unwind::libunwind::_Unwind_Context"*)* @rust_eh_personality {
start:
  %1 = alloca { i8*, i32 }, align 8
  %_9 = alloca i8, align 1
  %2 = alloca i64*, align 8
  %b = alloca %"std::sys::unix::locks::pthread_mutex::Mutex"*, align 8
  store %"std::sys::unix::locks::pthread_mutex::Mutex"* %0, %"std::sys::unix::locks::pthread_mutex::Mutex"** %b, align 8
  store i8 1, i8* %_9, align 1
  %_4 = bitcast %"std::sys::unix::locks::pthread_mutex::Mutex"** %b to %"alloc::alloc::Global"*
; invoke core::ptr::read
  invoke void @_ZN4core3ptr4read17h649c16c5d403d551E(%"alloc::alloc::Global"* %_4)
          to label %bb1 unwind label %cleanup

bb7:                                              ; preds = %bb4, %cleanup
  %3 = load i8, i8* %_9, align 1, !range !5, !noundef !1
  %4 = trunc i8 %3 to i1
  br i1 %4, label %bb6, label %bb5

cleanup:                                          ; preds = %start
  %5 = landingpad { i8*, i32 }
          cleanup
  %6 = extractvalue { i8*, i32 } %5, 0
  %7 = extractvalue { i8*, i32 } %5, 1
  %8 = getelementptr inbounds { i8*, i32 }, { i8*, i32 }* %1, i32 0, i32 0
  store i8* %6, i8** %8, align 8
  %9 = getelementptr inbounds { i8*, i32 }, { i8*, i32 }* %1, i32 0, i32 1
  store i32 %7, i32* %9, align 8
  br label %bb7

bb1:                                              ; preds = %start
  store i8 0, i8* %_9, align 1
  %_7 = load %"std::sys::unix::locks::pthread_mutex::Mutex"*, %"std::sys::unix::locks::pthread_mutex::Mutex"** %b, align 8, !nonnull !1, !align !4, !noundef !1
; invoke alloc::boxed::Box<T,A>::leak
  %_6 = invoke align 8 %"std::sys::unix::locks::pthread_mutex::Mutex"* @"_ZN5alloc5boxed16Box$LT$T$C$A$GT$4leak17hd1446b371b504763E"(%"std::sys::unix::locks::pthread_mutex::Mutex"* align 8 %_7)
          to label %bb2 unwind label %cleanup1

bb4:                                              ; preds = %cleanup1
  br label %bb7

cleanup1:                                         ; preds = %bb2, %bb1
  %10 = landingpad { i8*, i32 }
          cleanup
  %11 = extractvalue { i8*, i32 } %10, 0
  %12 = extractvalue { i8*, i32 } %10, 1
  %13 = getelementptr inbounds { i8*, i32 }, { i8*, i32 }* %1, i32 0, i32 0
  store i8* %11, i8** %13, align 8
  %14 = getelementptr inbounds { i8*, i32 }, { i8*, i32 }* %1, i32 0, i32 1
  store i32 %12, i32* %14, align 8
  br label %bb4

bb2:                                              ; preds = %bb1
; invoke <core::ptr::unique::Unique<T> as core::convert::From<&mut T>>::from
  %_5 = invoke i64* @"_ZN95_$LT$core..ptr..unique..Unique$LT$T$GT$$u20$as$u20$core..convert..From$LT$$RF$mut$u20$T$GT$$GT$4from17h1a01e766565c9ab3E"(%"std::sys::unix::locks::pthread_mutex::Mutex"* align 8 %_6)
          to label %bb3 unwind label %cleanup1

bb3:                                              ; preds = %bb2
  store i64* %_5, i64** %2, align 8
  %15 = bitcast i64** %2 to i8*
  %16 = getelementptr i8, i8* %15, i64 8
  %17 = bitcast i8* %16 to %"alloc::alloc::Global"*
  %18 = load i64*, i64** %2, align 8, !nonnull !1, !noundef !1
  ret i64* %18

bb5:                                              ; preds = %bb6, %bb7
  %19 = bitcast { i8*, i32 }* %1 to i8**
  %20 = load i8*, i8** %19, align 8
  %21 = getelementptr inbounds { i8*, i32 }, { i8*, i32 }* %1, i32 0, i32 1
  %22 = load i32, i32* %21, align 8
  %23 = insertvalue { i8*, i32 } undef, i8* %20, 0
  %24 = insertvalue { i8*, i32 } %23, i32 %22, 1
  resume { i8*, i32 } %24

bb6:                                              ; preds = %bb7
; invoke core::ptr::drop_in_place<alloc::boxed::Box<std::sys::unix::locks::pthread_mutex::Mutex>>
  invoke void @"_ZN4core3ptr89drop_in_place$LT$alloc..boxed..Box$LT$std..sys..unix..locks..pthread_mutex..Mutex$GT$$GT$17h36cda168f1e87447E"(%"std::sys::unix::locks::pthread_mutex::Mutex"** %b) #11
          to label %bb5 unwind label %abort

abort:                                            ; preds = %bb6
  %25 = landingpad { i8*, i32 }
          cleanup
; call core::panicking::panic_no_unwind
  call void @_ZN4core9panicking15panic_no_unwind17hfdf5806230424742E() #12
  unreachable
}

; alloc::boxed::Box<T,A>::into_raw_with_allocator
; Function Attrs: inlinehint uwtable
define i64* @"_ZN5alloc5boxed16Box$LT$T$C$A$GT$23into_raw_with_allocator17hb7da6d7c568dba00E"(%"std::sys::unix::locks::pthread_mutex::Mutex"* align 8 %b) unnamed_addr #0 personality i32 (i32, i32, i64, %"unwind::libunwind::_Unwind_Exception"*, %"unwind::libunwind::_Unwind_Context"*)* @rust_eh_personality {
start:
  %0 = alloca { i8*, i32 }, align 8
  %1 = alloca i64*, align 8
; call alloc::boxed::Box<T,A>::into_unique
  %_4 = call i64* @"_ZN5alloc5boxed16Box$LT$T$C$A$GT$11into_unique17hbbb538fa69289050E"(%"std::sys::unix::locks::pthread_mutex::Mutex"* align 8 %b)
  br label %bb1

bb1:                                              ; preds = %start
; invoke core::ptr::unique::Unique<T>::as_ptr
  %_6 = invoke %"std::sys::unix::locks::pthread_mutex::Mutex"* @"_ZN4core3ptr6unique15Unique$LT$T$GT$6as_ptr17heac80e6fd9ce1173E"(i64* %_4)
          to label %bb2 unwind label %cleanup

bb3:                                              ; preds = %cleanup
  br label %bb4

cleanup:                                          ; preds = %bb1
  %2 = landingpad { i8*, i32 }
          cleanup
  %3 = extractvalue { i8*, i32 } %2, 0
  %4 = extractvalue { i8*, i32 } %2, 1
  %5 = getelementptr inbounds { i8*, i32 }, { i8*, i32 }* %0, i32 0, i32 0
  store i8* %3, i8** %5, align 8
  %6 = getelementptr inbounds { i8*, i32 }, { i8*, i32 }* %0, i32 0, i32 1
  store i32 %4, i32* %6, align 8
  br label %bb3

bb2:                                              ; preds = %bb1
  %7 = bitcast i64** %1 to %"std::sys::unix::locks::pthread_mutex::Mutex"**
  store %"std::sys::unix::locks::pthread_mutex::Mutex"* %_6, %"std::sys::unix::locks::pthread_mutex::Mutex"** %7, align 8
  %8 = bitcast i64** %1 to i8*
  %9 = getelementptr i8, i8* %8, i64 8
  %10 = bitcast i8* %9 to %"alloc::alloc::Global"*
  %11 = load i64*, i64** %1, align 8
  ret i64* %11

bb4:                                              ; preds = %bb3
  %12 = bitcast { i8*, i32 }* %0 to i8**
  %13 = load i8*, i8** %12, align 8
  %14 = getelementptr inbounds { i8*, i32 }, { i8*, i32 }* %0, i32 0, i32 1
  %15 = load i32, i32* %14, align 8
  %16 = insertvalue { i8*, i32 } undef, i8* %13, 0
  %17 = insertvalue { i8*, i32 } %16, i32 %15, 1
  resume { i8*, i32 } %17
}

; alloc::boxed::Box<T,A>::leak
; Function Attrs: inlinehint uwtable
define align 8 %"std::sys::unix::locks::pthread_mutex::Mutex"* @"_ZN5alloc5boxed16Box$LT$T$C$A$GT$4leak17hd1446b371b504763E"(%"std::sys::unix::locks::pthread_mutex::Mutex"* align 8 %b) unnamed_addr #0 {
start:
  %0 = alloca i64*, align 8
  %_9 = alloca i64*, align 8
  %1 = bitcast i64** %0 to %"std::sys::unix::locks::pthread_mutex::Mutex"**
  store %"std::sys::unix::locks::pthread_mutex::Mutex"* %b, %"std::sys::unix::locks::pthread_mutex::Mutex"** %1, align 8
  %2 = load i64*, i64** %0, align 8, !nonnull !1, !align !4, !noundef !1
  store i64* %2, i64** %_9, align 8
  br label %bb1

bb1:                                              ; preds = %start
  %3 = bitcast i64** %_9 to %"std::sys::unix::locks::pthread_mutex::Mutex"**
  br label %bb2

bb2:                                              ; preds = %bb1
  %4 = bitcast %"std::sys::unix::locks::pthread_mutex::Mutex"** %3 to i64**
  %_6 = load i64*, i64** %4, align 8, !nonnull !1, !noundef !1
; call core::ptr::unique::Unique<T>::as_ptr
  %_5 = call %"std::sys::unix::locks::pthread_mutex::Mutex"* @"_ZN4core3ptr6unique15Unique$LT$T$GT$6as_ptr17heac80e6fd9ce1173E"(i64* %_6)
  br label %bb3

bb3:                                              ; preds = %bb2
  ret %"std::sys::unix::locks::pthread_mutex::Mutex"* %_5
}

; alloc::boxed::Box<T,A>::into_raw
; Function Attrs: inlinehint uwtable
define %"std::sys::unix::locks::pthread_mutex::Mutex"* @"_ZN5alloc5boxed16Box$LT$T$C$A$GT$8into_raw17h912f843723cfd842E"(%"std::sys::unix::locks::pthread_mutex::Mutex"* align 8 %b) unnamed_addr #0 {
start:
; call alloc::boxed::Box<T,A>::into_raw_with_allocator
  %_2 = call i64* @"_ZN5alloc5boxed16Box$LT$T$C$A$GT$23into_raw_with_allocator17hb7da6d7c568dba00E"(%"std::sys::unix::locks::pthread_mutex::Mutex"* align 8 %b)
  br label %bb1

bb1:                                              ; preds = %start
  %0 = bitcast i64* %_2 to %"std::sys::unix::locks::pthread_mutex::Mutex"*
  br label %bb2

bb2:                                              ; preds = %bb1
  ret %"std::sys::unix::locks::pthread_mutex::Mutex"* %0
}

; <alloc::alloc::Global as core::alloc::Allocator>::deallocate
; Function Attrs: inlinehint uwtable
define internal void @"_ZN63_$LT$alloc..alloc..Global$u20$as$u20$core..alloc..Allocator$GT$10deallocate17h064aee16052bfe66E"(%"alloc::alloc::Global"* align 1 %self, i8* %ptr, i64 %0, i64 %1) unnamed_addr #0 {
start:
  %layout = alloca { i64, i64 }, align 8
  %2 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %layout, i32 0, i32 0
  store i64 %0, i64* %2, align 8
  %3 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %layout, i32 0, i32 1
  store i64 %1, i64* %3, align 8
; call core::alloc::layout::Layout::size
  %_4 = call i64 @_ZN4core5alloc6layout6Layout4size17h5f7d8cb46f847c96E({ i64, i64 }* align 8 %layout)
  br label %bb1

bb1:                                              ; preds = %start
  %4 = icmp eq i64 %_4, 0
  br i1 %4, label %bb5, label %bb2

bb5:                                              ; preds = %bb1
  br label %bb6

bb2:                                              ; preds = %bb1
; call core::ptr::non_null::NonNull<T>::as_ptr
  %_6 = call i8* @"_ZN4core3ptr8non_null16NonNull$LT$T$GT$6as_ptr17h6fe713df0759bcaaE"(i8* %ptr)
  br label %bb3

bb3:                                              ; preds = %bb2
  %5 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %layout, i32 0, i32 0
  %_8.0 = load i64, i64* %5, align 8
  %6 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %layout, i32 0, i32 1
  %_8.1 = load i64, i64* %6, align 8, !range !7, !noundef !1
; call alloc::alloc::dealloc
  call void @_ZN5alloc5alloc7dealloc17h06cffeeba27255afE(i8* %_6, i64 %_8.0, i64 %_8.1)
  br label %bb4

bb4:                                              ; preds = %bb3
  br label %bb6

bb6:                                              ; preds = %bb5, %bb4
  ret void
}

; <std::sync::poison::PoisonError<T> as core::fmt::Debug>::fmt
; Function Attrs: uwtable
define zeroext i1 @"_ZN76_$LT$std..sync..poison..PoisonError$LT$T$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h3ed8e3f089979757E"({ i64*, i8 }* align 8 %self, %"core::fmt::Formatter"* align 8 %f) unnamed_addr #2 {
start:
  %_4 = alloca %"core::fmt::builders::DebugStruct", align 8
; call core::fmt::Formatter::debug_struct
  call void @_ZN4core3fmt9Formatter12debug_struct17h523052f7531533c5E(%"core::fmt::builders::DebugStruct"* sret(%"core::fmt::builders::DebugStruct") %_4, %"core::fmt::Formatter"* align 8 %f, [0 x i8]* align 1 bitcast (<{ [11 x i8] }>* @alloc193 to [0 x i8]*), i64 11)
  br label %bb1

bb1:                                              ; preds = %start
; call core::fmt::builders::DebugStruct::finish_non_exhaustive
  %0 = call zeroext i1 @_ZN4core3fmt8builders11DebugStruct21finish_non_exhaustive17h4490b7214d51b7d4E(%"core::fmt::builders::DebugStruct"* align 8 %_4)
  br label %bb2

bb2:                                              ; preds = %bb1
  ret i1 %0
}

; <std::sync::mutex::MutexGuard<T> as core::ops::drop::Drop>::drop
; Function Attrs: inlinehint uwtable
define void @"_ZN79_$LT$std..sync..mutex..MutexGuard$LT$T$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17hc084df6b6e1df28aE"({ i64*, i8 }* align 8 %self) unnamed_addr #0 {
start:
  %0 = bitcast { i64*, i8 }* %self to %"std::sync::mutex::Mutex<i32>"**
  %_8 = load %"std::sync::mutex::Mutex<i32>"*, %"std::sync::mutex::Mutex<i32>"** %0, align 8, !nonnull !1, !align !4, !noundef !1
  %_3 = getelementptr inbounds %"std::sync::mutex::Mutex<i32>", %"std::sync::mutex::Mutex<i32>"* %_8, i32 0, i32 1
  %_5 = getelementptr inbounds { i64*, i8 }, { i64*, i8 }* %self, i32 0, i32 1
; call std::sync::poison::Flag::done
  call void @_ZN3std4sync6poison4Flag4done17h600127a8854403adE(%"std::sync::poison::Flag"* align 1 %_3, i8* align 1 %_5)
  br label %bb1

bb1:                                              ; preds = %start
  %1 = bitcast { i64*, i8 }* %self to %"std::sync::mutex::Mutex<i32>"**
  %_9 = load %"std::sync::mutex::Mutex<i32>"*, %"std::sync::mutex::Mutex<i32>"** %1, align 8, !nonnull !1, !align !4, !noundef !1
  %_7 = bitcast %"std::sync::mutex::Mutex<i32>"* %_9 to %"std::sys_common::mutex::MovableMutex"*
; call std::sys_common::mutex::MovableMutex::raw_unlock
  call void @_ZN3std10sys_common5mutex12MovableMutex10raw_unlock17h6fd23d8c745e3a52E(%"std::sys_common::mutex::MovableMutex"* align 8 %_7)
  br label %bb2

bb2:                                              ; preds = %bb1
  ret void
}

; <std::sync::mutex::MutexGuard<T> as core::ops::deref::Deref>::deref
; Function Attrs: uwtable
define align 4 i32* @"_ZN81_$LT$std..sync..mutex..MutexGuard$LT$T$GT$$u20$as$u20$core..ops..deref..Deref$GT$5deref17hc14c9711987ae17eE"({ i64*, i8 }* align 8 %self) unnamed_addr #2 {
start:
  %0 = bitcast { i64*, i8 }* %self to %"std::sync::mutex::Mutex<i32>"**
  %_4 = load %"std::sync::mutex::Mutex<i32>"*, %"std::sync::mutex::Mutex<i32>"** %0, align 8, !nonnull !1, !align !4, !noundef !1
  %_3 = getelementptr inbounds %"std::sync::mutex::Mutex<i32>", %"std::sync::mutex::Mutex<i32>"* %_4, i32 0, i32 3
  br label %bb1

bb1:                                              ; preds = %start
  ret i32* %_3
}

; <std::sys::unix::locks::pthread_mutex::Mutex as core::ops::drop::Drop>::drop
; Function Attrs: inlinehint uwtable
define internal void @"_ZN85_$LT$std..sys..unix..locks..pthread_mutex..Mutex$u20$as$u20$core..ops..drop..Drop$GT$4drop17h3353513b544a07c3E"(%"std::sys::unix::locks::pthread_mutex::Mutex"* align 8 %self) unnamed_addr #0 {
start:
; call std::sys::unix::locks::pthread_mutex::Mutex::destroy
  call void @_ZN3std3sys4unix5locks13pthread_mutex5Mutex7destroy17h35e1c8f63f793101E(%"std::sys::unix::locks::pthread_mutex::Mutex"* align 8 %self)
  br label %bb1

bb1:                                              ; preds = %start
  ret void
}

; <std::sys_common::lazy_box::LazyBox<T> as core::ops::drop::Drop>::drop
; Function Attrs: uwtable
define void @"_ZN85_$LT$std..sys_common..lazy_box..LazyBox$LT$T$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17hf9e8f9b25263dc25E"(%"std::sys_common::lazy_box::LazyBox<std::sys::unix::locks::pthread_mutex::Mutex>"* align 8 %self) unnamed_addr #2 {
start:
  %_4 = bitcast %"std::sys_common::lazy_box::LazyBox<std::sys::unix::locks::pthread_mutex::Mutex>"* %self to %"core::sync::atomic::AtomicPtr<std::sys::unix::locks::pthread_mutex::Mutex>"*
; call core::sync::atomic::AtomicPtr<T>::get_mut
  %_3 = call align 8 %"std::sys::unix::locks::pthread_mutex::Mutex"** @"_ZN4core4sync6atomic18AtomicPtr$LT$T$GT$7get_mut17hf2e79c02ba9e8cdeE"(%"core::sync::atomic::AtomicPtr<std::sys::unix::locks::pthread_mutex::Mutex>"* align 8 %_4)
  br label %bb1

bb1:                                              ; preds = %start
  %ptr = load %"std::sys::unix::locks::pthread_mutex::Mutex"*, %"std::sys::unix::locks::pthread_mutex::Mutex"** %_3, align 8
; call core::ptr::mut_ptr::<impl *mut T>::is_null
  %_6 = call zeroext i1 @"_ZN4core3ptr7mut_ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$7is_null17h712b26941d61c13aE"(%"std::sys::unix::locks::pthread_mutex::Mutex"* %ptr)
  br label %bb2

bb2:                                              ; preds = %bb1
  %_5 = xor i1 %_6, true
  br i1 %_5, label %bb3, label %bb6

bb6:                                              ; preds = %bb5, %bb2
  ret void

bb3:                                              ; preds = %bb2
; call alloc::boxed::Box<T>::from_raw
  %_9 = call align 8 %"std::sys::unix::locks::pthread_mutex::Mutex"* @"_ZN5alloc5boxed12Box$LT$T$GT$8from_raw17h9016c750bf2f2bbdE"(%"std::sys::unix::locks::pthread_mutex::Mutex"* %ptr)
  br label %bb4

bb4:                                              ; preds = %bb3
; call core::mem::drop
  call void @_ZN4core3mem4drop17hb6b217fed38f815aE(%"std::sys::unix::locks::pthread_mutex::Mutex"* align 8 %_9)
  br label %bb5

bb5:                                              ; preds = %bb4
  br label %bb6
}

; <std::sys_common::lazy_box::LazyBox<T> as core::ops::deref::Deref>::deref
; Function Attrs: inlinehint uwtable
define align 8 %"std::sys::unix::locks::pthread_mutex::Mutex"* @"_ZN87_$LT$std..sys_common..lazy_box..LazyBox$LT$T$GT$$u20$as$u20$core..ops..deref..Deref$GT$5deref17hd9449bbbda440220E"(%"std::sys_common::lazy_box::LazyBox<std::sys::unix::locks::pthread_mutex::Mutex>"* align 8 %self) unnamed_addr #0 {
start:
; call std::sys_common::lazy_box::LazyBox<T>::get_pointer
  %_2 = call %"std::sys::unix::locks::pthread_mutex::Mutex"* @"_ZN3std10sys_common8lazy_box16LazyBox$LT$T$GT$11get_pointer17h7f0eb711b80b7651E"(%"std::sys_common::lazy_box::LazyBox<std::sys::unix::locks::pthread_mutex::Mutex>"* align 8 %self)
  br label %bb1

bb1:                                              ; preds = %start
  ret %"std::sys::unix::locks::pthread_mutex::Mutex"* %_2
}

; <core::ptr::unique::Unique<T> as core::convert::From<&mut T>>::from
; Function Attrs: inlinehint uwtable
define i64* @"_ZN95_$LT$core..ptr..unique..Unique$LT$T$GT$$u20$as$u20$core..convert..From$LT$$RF$mut$u20$T$GT$$GT$4from17h1a01e766565c9ab3E"(%"std::sys::unix::locks::pthread_mutex::Mutex"* align 8 %reference) unnamed_addr #0 {
start:
; call <core::ptr::non_null::NonNull<T> as core::convert::From<&mut T>>::from
  %_2 = call i64* @"_ZN98_$LT$core..ptr..non_null..NonNull$LT$T$GT$$u20$as$u20$core..convert..From$LT$$RF$mut$u20$T$GT$$GT$4from17hb738450a3df4da03E"(%"std::sys::unix::locks::pthread_mutex::Mutex"* align 8 %reference)
  br label %bb1

bb1:                                              ; preds = %start
; call <core::ptr::unique::Unique<T> as core::convert::From<core::ptr::non_null::NonNull<T>>>::from
  %0 = call i64* @"_ZN119_$LT$core..ptr..unique..Unique$LT$T$GT$$u20$as$u20$core..convert..From$LT$core..ptr..non_null..NonNull$LT$T$GT$$GT$$GT$4from17h3c047d7c54aa1829E"(i64* %_2)
  br label %bb2

bb2:                                              ; preds = %bb1
  ret i64* %0
}

; <core::ptr::non_null::NonNull<T> as core::convert::From<&mut T>>::from
; Function Attrs: inlinehint uwtable
define i64* @"_ZN98_$LT$core..ptr..non_null..NonNull$LT$T$GT$$u20$as$u20$core..convert..From$LT$$RF$mut$u20$T$GT$$GT$4from17hb738450a3df4da03E"(%"std::sys::unix::locks::pthread_mutex::Mutex"* align 8 %reference) unnamed_addr #0 {
start:
  %0 = alloca i64*, align 8
  %1 = bitcast i64** %0 to %"std::sys::unix::locks::pthread_mutex::Mutex"**
  store %"std::sys::unix::locks::pthread_mutex::Mutex"* %reference, %"std::sys::unix::locks::pthread_mutex::Mutex"** %1, align 8
  %2 = load i64*, i64** %0, align 8, !nonnull !1, !noundef !1
  ret i64* %2
}

; probe1::probe
; Function Attrs: uwtable
define void @_ZN6probe15probe17he098e2c9f54edf27E() unnamed_addr #2 personality i32 (i32, i32, i64, %"unwind::libunwind::_Unwind_Exception"*, %"unwind::libunwind::_Unwind_Context"*)* @rust_eh_personality {
start:
  %0 = alloca { i8*, i32 }, align 8
  %_4 = alloca %"core::result::Result<std::sync::mutex::MutexGuard<i32>, std::sync::poison::PoisonError<std::sync::mutex::MutexGuard<i32>>>", align 8
  %_3 = alloca { i64*, i8 }, align 8
; call std::sync::mutex::Mutex<T>::lock
  call void @"_ZN3std4sync5mutex14Mutex$LT$T$GT$4lock17heb9f1d8b8be095fdE"(%"core::result::Result<std::sync::mutex::MutexGuard<i32>, std::sync::poison::PoisonError<std::sync::mutex::MutexGuard<i32>>>"* sret(%"core::result::Result<std::sync::mutex::MutexGuard<i32>, std::sync::poison::PoisonError<std::sync::mutex::MutexGuard<i32>>>") %_4, %"std::sync::mutex::Mutex<i32>"* align 8 bitcast (<{ [9 x i8], [3 x i8], [4 x i8] }>* @_ZN6probe15probe8MY_MUTEX17h85724f22b3179500E to %"std::sync::mutex::Mutex<i32>"*))
  br label %bb1

bb1:                                              ; preds = %start
; call core::result::Result<T,E>::unwrap
  %1 = call { i64*, i8 } @"_ZN4core6result19Result$LT$T$C$E$GT$6unwrap17h59508c3fa5ee950cE"(%"core::result::Result<std::sync::mutex::MutexGuard<i32>, std::sync::poison::PoisonError<std::sync::mutex::MutexGuard<i32>>>"* %_4, %"core::panic::location::Location"* align 8 bitcast (<{ i8*, [16 x i8] }>* @alloc195 to %"core::panic::location::Location"*))
  store { i64*, i8 } %1, { i64*, i8 }* %_3, align 8
  br label %bb2

bb2:                                              ; preds = %bb1
; invoke <std::sync::mutex::MutexGuard<T> as core::ops::deref::Deref>::deref
  %_1 = invoke align 4 i32* @"_ZN81_$LT$std..sync..mutex..MutexGuard$LT$T$GT$$u20$as$u20$core..ops..deref..Deref$GT$5deref17hc14c9711987ae17eE"({ i64*, i8 }* align 8 %_3)
          to label %bb3 unwind label %cleanup

bb5:                                              ; preds = %cleanup
; invoke core::ptr::drop_in_place<std::sync::mutex::MutexGuard<i32>>
  invoke void @"_ZN4core3ptr60drop_in_place$LT$std..sync..mutex..MutexGuard$LT$i32$GT$$GT$17ha951d3a81801c8e0E"({ i64*, i8 }* %_3) #11
          to label %bb6 unwind label %abort

cleanup:                                          ; preds = %bb2
  %2 = landingpad { i8*, i32 }
          cleanup
  %3 = extractvalue { i8*, i32 } %2, 0
  %4 = extractvalue { i8*, i32 } %2, 1
  %5 = getelementptr inbounds { i8*, i32 }, { i8*, i32 }* %0, i32 0, i32 0
  store i8* %3, i8** %5, align 8
  %6 = getelementptr inbounds { i8*, i32 }, { i8*, i32 }* %0, i32 0, i32 1
  store i32 %4, i32* %6, align 8
  br label %bb5

bb3:                                              ; preds = %bb2
; call core::ptr::drop_in_place<std::sync::mutex::MutexGuard<i32>>
  call void @"_ZN4core3ptr60drop_in_place$LT$std..sync..mutex..MutexGuard$LT$i32$GT$$GT$17ha951d3a81801c8e0E"({ i64*, i8 }* %_3)
  br label %bb4

abort:                                            ; preds = %bb5
  %7 = landingpad { i8*, i32 }
          cleanup
; call core::panicking::panic_no_unwind
  call void @_ZN4core9panicking15panic_no_unwind17hfdf5806230424742E() #12
  unreachable

bb6:                                              ; preds = %bb5
  %8 = bitcast { i8*, i32 }* %0 to i8**
  %9 = load i8*, i8** %8, align 8
  %10 = getelementptr inbounds { i8*, i32 }, { i8*, i32 }* %0, i32 0, i32 1
  %11 = load i32, i32* %10, align 8
  %12 = insertvalue { i8*, i32 } undef, i8* %9, 0
  %13 = insertvalue { i8*, i32 } %12, i32 %11, 1
  resume { i8*, i32 } %13

bb4:                                              ; preds = %bb3
  ret void
}

; <std::sys::unix::locks::pthread_mutex::Mutex as std::sys_common::lazy_box::LazyInit>::init
; Function Attrs: uwtable
declare align 8 %"std::sys::unix::locks::pthread_mutex::Mutex"* @"_ZN99_$LT$std..sys..unix..locks..pthread_mutex..Mutex$u20$as$u20$std..sys_common..lazy_box..LazyInit$GT$4init17h803c2be3b9ea0a70E"() unnamed_addr #2

; Function Attrs: uwtable
declare i32 @pthread_mutex_lock(%"libc::unix::bsd::apple::pthread_mutex_t"*) unnamed_addr #2

; Function Attrs: uwtable
declare i32 @pthread_mutex_unlock(%"libc::unix::bsd::apple::pthread_mutex_t"*) unnamed_addr #2

; Function Attrs: uwtable
declare i32 @pthread_mutex_destroy(%"libc::unix::bsd::apple::pthread_mutex_t"*) unnamed_addr #2

; std::panicking::panic_count::is_zero_slow_path
; Function Attrs: cold noinline uwtable
declare zeroext i1 @_ZN3std9panicking11panic_count17is_zero_slow_path17h203a8ec265315145E() unnamed_addr #3

; core::panicking::panic_fmt
; Function Attrs: cold noinline noreturn uwtable
declare void @_ZN4core9panicking9panic_fmt17h9fec86f6a9c4146eE(%"core::fmt::Arguments"*, %"core::panic::location::Location"* align 8) unnamed_addr #4

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #5

; Function Attrs: inaccessiblememonly nofree nosync nounwind willreturn
declare void @llvm.assume(i1 noundef) #6

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #7

; Function Attrs: uwtable
declare i32 @rust_eh_personality(i32, i32, i64, %"unwind::libunwind::_Unwind_Exception"*, %"unwind::libunwind::_Unwind_Context"*) unnamed_addr #2

; core::panicking::panic_no_unwind
; Function Attrs: cold noinline noreturn nounwind uwtable
declare void @_ZN4core9panicking15panic_no_unwind17hfdf5806230424742E() unnamed_addr #8

; core::result::unwrap_failed
; Function Attrs: cold noinline noreturn uwtable
declare void @_ZN4core6result13unwrap_failed17h04f08301b97a771cE([0 x i8]* align 1, i64, {}* align 1, [3 x i64]* align 8, %"core::panic::location::Location"* align 8) unnamed_addr #4

; Function Attrs: nounwind uwtable
declare void @__rust_dealloc(i8*, i64, i64) unnamed_addr #9

; core::fmt::Formatter::debug_struct
; Function Attrs: uwtable
declare void @_ZN4core3fmt9Formatter12debug_struct17h523052f7531533c5E(%"core::fmt::builders::DebugStruct"* sret(%"core::fmt::builders::DebugStruct"), %"core::fmt::Formatter"* align 8, [0 x i8]* align 1, i64) unnamed_addr #2

; core::fmt::builders::DebugStruct::finish_non_exhaustive
; Function Attrs: uwtable
declare zeroext i1 @_ZN4core3fmt8builders11DebugStruct21finish_non_exhaustive17h4490b7214d51b7d4E(%"core::fmt::builders::DebugStruct"* align 8) unnamed_addr #2

attributes #0 = { inlinehint uwtable "frame-pointer"="non-leaf" "target-cpu"="apple-a14" }
attributes #1 = { cold uwtable "frame-pointer"="non-leaf" "target-cpu"="apple-a14" }
attributes #2 = { uwtable "frame-pointer"="non-leaf" "target-cpu"="apple-a14" }
attributes #3 = { cold noinline uwtable "frame-pointer"="non-leaf" "target-cpu"="apple-a14" }
attributes #4 = { cold noinline noreturn uwtable "frame-pointer"="non-leaf" "target-cpu"="apple-a14" }
attributes #5 = { argmemonly nofree nounwind willreturn writeonly }
attributes #6 = { inaccessiblememonly nofree nosync nounwind willreturn }
attributes #7 = { argmemonly nofree nounwind willreturn }
attributes #8 = { cold noinline noreturn nounwind uwtable "frame-pointer"="non-leaf" "target-cpu"="apple-a14" }
attributes #9 = { nounwind uwtable "frame-pointer"="non-leaf" "target-cpu"="apple-a14" }
attributes #10 = { noreturn }
attributes #11 = { noinline }
attributes #12 = { noinline noreturn nounwind }
attributes #13 = { nounwind }

!llvm.module.flags = !{!0}

!0 = !{i32 7, !"PIC Level", i32 2}
!1 = !{}
!2 = !{i8 0, i8 5}
!3 = !{i64 0, i64 2}
!4 = !{i64 8}
!5 = !{i8 0, i8 2}
!6 = !{i64 1, i64 0}
!7 = !{i64 1, i64 -9223372036854775807}
