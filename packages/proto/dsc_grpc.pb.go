// Code generated by protoc-gen-go-grpc. DO NOT EDIT.

package __

import (
	context "context"
	grpc "google.golang.org/grpc"
	codes "google.golang.org/grpc/codes"
	status "google.golang.org/grpc/status"
	emptypb "google.golang.org/protobuf/types/known/emptypb"
	wrapperspb "google.golang.org/protobuf/types/known/wrapperspb"
)

// This is a compile-time assertion to ensure that this generated file
// is compatible with the grpc package it is being compiled against.
const _ = grpc.SupportPackageIsVersion7

// HardwareClient is the client API for Hardware service.
//
// For semantics around ctx use and closing/ending streaming RPCs, please refer to https://pkg.go.dev/google.golang.org/grpc/?tab=doc#ClientConn.NewStream.
type HardwareClient interface {
	IsSecureBootEnabled(ctx context.Context, in *emptypb.Empty, opts ...grpc.CallOption) (*IsSecureBootEnabledResponse, error)
}

type hardwareClient struct {
	cc grpc.ClientConnInterface
}

func NewHardwareClient(cc grpc.ClientConnInterface) HardwareClient {
	return &hardwareClient{cc}
}

func (c *hardwareClient) IsSecureBootEnabled(ctx context.Context, in *emptypb.Empty, opts ...grpc.CallOption) (*IsSecureBootEnabledResponse, error) {
	out := new(IsSecureBootEnabledResponse)
	err := c.cc.Invoke(ctx, "/Hardware/IsSecureBootEnabled", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

// HardwareServer is the server API for Hardware service.
// All implementations must embed UnimplementedHardwareServer
// for forward compatibility
type HardwareServer interface {
	IsSecureBootEnabled(context.Context, *emptypb.Empty) (*IsSecureBootEnabledResponse, error)
	mustEmbedUnimplementedHardwareServer()
}

// UnimplementedHardwareServer must be embedded to have forward compatible implementations.
type UnimplementedHardwareServer struct {
}

func (UnimplementedHardwareServer) IsSecureBootEnabled(context.Context, *emptypb.Empty) (*IsSecureBootEnabledResponse, error) {
	return nil, status.Errorf(codes.Unimplemented, "method IsSecureBootEnabled not implemented")
}
func (UnimplementedHardwareServer) mustEmbedUnimplementedHardwareServer() {}

// UnsafeHardwareServer may be embedded to opt out of forward compatibility for this service.
// Use of this interface is not recommended, as added methods to HardwareServer will
// result in compilation errors.
type UnsafeHardwareServer interface {
	mustEmbedUnimplementedHardwareServer()
}

func RegisterHardwareServer(s *grpc.Server, srv HardwareServer) {
	s.RegisterService(&_Hardware_serviceDesc, srv)
}

func _Hardware_IsSecureBootEnabled_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(emptypb.Empty)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(HardwareServer).IsSecureBootEnabled(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/Hardware/IsSecureBootEnabled",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(HardwareServer).IsSecureBootEnabled(ctx, req.(*emptypb.Empty))
	}
	return interceptor(ctx, in, info, handler)
}

var _Hardware_serviceDesc = grpc.ServiceDesc{
	ServiceName: "Hardware",
	HandlerType: (*HardwareServer)(nil),
	Methods: []grpc.MethodDesc{
		{
			MethodName: "IsSecureBootEnabled",
			Handler:    _Hardware_IsSecureBootEnabled_Handler,
		},
	},
	Streams:  []grpc.StreamDesc{},
	Metadata: "dsc.proto",
}

// ProClient is the client API for Pro service.
//
// For semantics around ctx use and closing/ending streaming RPCs, please refer to https://pkg.go.dev/google.golang.org/grpc/?tab=doc#ClientConn.NewStream.
type ProClient interface {
	IsMachineProAttached(ctx context.Context, in *emptypb.Empty, opts ...grpc.CallOption) (*wrapperspb.BoolValue, error)
	IsEsmInfraEnabled(ctx context.Context, in *emptypb.Empty, opts ...grpc.CallOption) (*wrapperspb.BoolValue, error)
	IsEsmAppsEnabled(ctx context.Context, in *emptypb.Empty, opts ...grpc.CallOption) (*wrapperspb.BoolValue, error)
	IsKernelLivePatchEnabled(ctx context.Context, in *emptypb.Empty, opts ...grpc.CallOption) (*wrapperspb.BoolValue, error)
	// For a magic flow, the front-end shall call Initiate and then immediately
	// Wait. Then finally, upon user confirmation, Attach shall be called.
	//
	// Attach shall be called directly if the full token flow is selected.
	InitiateProMagicFlow(ctx context.Context, in *emptypb.Empty, opts ...grpc.CallOption) (*InitiateResponse, error)
	WaitProMagicFlow(ctx context.Context, in *emptypb.Empty, opts ...grpc.CallOption) (*WaitResponse, error)
	AttachProToMachine(ctx context.Context, in *AttachRequest, opts ...grpc.CallOption) (*emptypb.Empty, error)
	EnableInfra(ctx context.Context, in *emptypb.Empty, opts ...grpc.CallOption) (*emptypb.Empty, error)
	DisableInfra(ctx context.Context, in *emptypb.Empty, opts ...grpc.CallOption) (*emptypb.Empty, error)
	EnableEsmApps(ctx context.Context, in *emptypb.Empty, opts ...grpc.CallOption) (*emptypb.Empty, error)
	DisableEsmApps(ctx context.Context, in *emptypb.Empty, opts ...grpc.CallOption) (*emptypb.Empty, error)
	EnableKernelLivePatch(ctx context.Context, in *emptypb.Empty, opts ...grpc.CallOption) (*emptypb.Empty, error)
	DisableKernelLivePatch(ctx context.Context, in *emptypb.Empty, opts ...grpc.CallOption) (*emptypb.Empty, error)
}

type proClient struct {
	cc grpc.ClientConnInterface
}

func NewProClient(cc grpc.ClientConnInterface) ProClient {
	return &proClient{cc}
}

func (c *proClient) IsMachineProAttached(ctx context.Context, in *emptypb.Empty, opts ...grpc.CallOption) (*wrapperspb.BoolValue, error) {
	out := new(wrapperspb.BoolValue)
	err := c.cc.Invoke(ctx, "/Pro/IsMachineProAttached", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *proClient) IsEsmInfraEnabled(ctx context.Context, in *emptypb.Empty, opts ...grpc.CallOption) (*wrapperspb.BoolValue, error) {
	out := new(wrapperspb.BoolValue)
	err := c.cc.Invoke(ctx, "/Pro/IsEsmInfraEnabled", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *proClient) IsEsmAppsEnabled(ctx context.Context, in *emptypb.Empty, opts ...grpc.CallOption) (*wrapperspb.BoolValue, error) {
	out := new(wrapperspb.BoolValue)
	err := c.cc.Invoke(ctx, "/Pro/IsEsmAppsEnabled", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *proClient) IsKernelLivePatchEnabled(ctx context.Context, in *emptypb.Empty, opts ...grpc.CallOption) (*wrapperspb.BoolValue, error) {
	out := new(wrapperspb.BoolValue)
	err := c.cc.Invoke(ctx, "/Pro/IsKernelLivePatchEnabled", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *proClient) InitiateProMagicFlow(ctx context.Context, in *emptypb.Empty, opts ...grpc.CallOption) (*InitiateResponse, error) {
	out := new(InitiateResponse)
	err := c.cc.Invoke(ctx, "/Pro/InitiateProMagicFlow", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *proClient) WaitProMagicFlow(ctx context.Context, in *emptypb.Empty, opts ...grpc.CallOption) (*WaitResponse, error) {
	out := new(WaitResponse)
	err := c.cc.Invoke(ctx, "/Pro/WaitProMagicFlow", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *proClient) AttachProToMachine(ctx context.Context, in *AttachRequest, opts ...grpc.CallOption) (*emptypb.Empty, error) {
	out := new(emptypb.Empty)
	err := c.cc.Invoke(ctx, "/Pro/AttachProToMachine", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *proClient) EnableInfra(ctx context.Context, in *emptypb.Empty, opts ...grpc.CallOption) (*emptypb.Empty, error) {
	out := new(emptypb.Empty)
	err := c.cc.Invoke(ctx, "/Pro/EnableInfra", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *proClient) DisableInfra(ctx context.Context, in *emptypb.Empty, opts ...grpc.CallOption) (*emptypb.Empty, error) {
	out := new(emptypb.Empty)
	err := c.cc.Invoke(ctx, "/Pro/DisableInfra", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *proClient) EnableEsmApps(ctx context.Context, in *emptypb.Empty, opts ...grpc.CallOption) (*emptypb.Empty, error) {
	out := new(emptypb.Empty)
	err := c.cc.Invoke(ctx, "/Pro/EnableEsmApps", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *proClient) DisableEsmApps(ctx context.Context, in *emptypb.Empty, opts ...grpc.CallOption) (*emptypb.Empty, error) {
	out := new(emptypb.Empty)
	err := c.cc.Invoke(ctx, "/Pro/DisableEsmApps", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *proClient) EnableKernelLivePatch(ctx context.Context, in *emptypb.Empty, opts ...grpc.CallOption) (*emptypb.Empty, error) {
	out := new(emptypb.Empty)
	err := c.cc.Invoke(ctx, "/Pro/EnableKernelLivePatch", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *proClient) DisableKernelLivePatch(ctx context.Context, in *emptypb.Empty, opts ...grpc.CallOption) (*emptypb.Empty, error) {
	out := new(emptypb.Empty)
	err := c.cc.Invoke(ctx, "/Pro/DisableKernelLivePatch", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

// ProServer is the server API for Pro service.
// All implementations must embed UnimplementedProServer
// for forward compatibility
type ProServer interface {
	IsMachineProAttached(context.Context, *emptypb.Empty) (*wrapperspb.BoolValue, error)
	IsEsmInfraEnabled(context.Context, *emptypb.Empty) (*wrapperspb.BoolValue, error)
	IsEsmAppsEnabled(context.Context, *emptypb.Empty) (*wrapperspb.BoolValue, error)
	IsKernelLivePatchEnabled(context.Context, *emptypb.Empty) (*wrapperspb.BoolValue, error)
	// For a magic flow, the front-end shall call Initiate and then immediately
	// Wait. Then finally, upon user confirmation, Attach shall be called.
	//
	// Attach shall be called directly if the full token flow is selected.
	InitiateProMagicFlow(context.Context, *emptypb.Empty) (*InitiateResponse, error)
	WaitProMagicFlow(context.Context, *emptypb.Empty) (*WaitResponse, error)
	AttachProToMachine(context.Context, *AttachRequest) (*emptypb.Empty, error)
	EnableInfra(context.Context, *emptypb.Empty) (*emptypb.Empty, error)
	DisableInfra(context.Context, *emptypb.Empty) (*emptypb.Empty, error)
	EnableEsmApps(context.Context, *emptypb.Empty) (*emptypb.Empty, error)
	DisableEsmApps(context.Context, *emptypb.Empty) (*emptypb.Empty, error)
	EnableKernelLivePatch(context.Context, *emptypb.Empty) (*emptypb.Empty, error)
	DisableKernelLivePatch(context.Context, *emptypb.Empty) (*emptypb.Empty, error)
	mustEmbedUnimplementedProServer()
}

// UnimplementedProServer must be embedded to have forward compatible implementations.
type UnimplementedProServer struct {
}

func (UnimplementedProServer) IsMachineProAttached(context.Context, *emptypb.Empty) (*wrapperspb.BoolValue, error) {
	return nil, status.Errorf(codes.Unimplemented, "method IsMachineProAttached not implemented")
}
func (UnimplementedProServer) IsEsmInfraEnabled(context.Context, *emptypb.Empty) (*wrapperspb.BoolValue, error) {
	return nil, status.Errorf(codes.Unimplemented, "method IsEsmInfraEnabled not implemented")
}
func (UnimplementedProServer) IsEsmAppsEnabled(context.Context, *emptypb.Empty) (*wrapperspb.BoolValue, error) {
	return nil, status.Errorf(codes.Unimplemented, "method IsEsmAppsEnabled not implemented")
}
func (UnimplementedProServer) IsKernelLivePatchEnabled(context.Context, *emptypb.Empty) (*wrapperspb.BoolValue, error) {
	return nil, status.Errorf(codes.Unimplemented, "method IsKernelLivePatchEnabled not implemented")
}
func (UnimplementedProServer) InitiateProMagicFlow(context.Context, *emptypb.Empty) (*InitiateResponse, error) {
	return nil, status.Errorf(codes.Unimplemented, "method InitiateProMagicFlow not implemented")
}
func (UnimplementedProServer) WaitProMagicFlow(context.Context, *emptypb.Empty) (*WaitResponse, error) {
	return nil, status.Errorf(codes.Unimplemented, "method WaitProMagicFlow not implemented")
}
func (UnimplementedProServer) AttachProToMachine(context.Context, *AttachRequest) (*emptypb.Empty, error) {
	return nil, status.Errorf(codes.Unimplemented, "method AttachProToMachine not implemented")
}
func (UnimplementedProServer) EnableInfra(context.Context, *emptypb.Empty) (*emptypb.Empty, error) {
	return nil, status.Errorf(codes.Unimplemented, "method EnableInfra not implemented")
}
func (UnimplementedProServer) DisableInfra(context.Context, *emptypb.Empty) (*emptypb.Empty, error) {
	return nil, status.Errorf(codes.Unimplemented, "method DisableInfra not implemented")
}
func (UnimplementedProServer) EnableEsmApps(context.Context, *emptypb.Empty) (*emptypb.Empty, error) {
	return nil, status.Errorf(codes.Unimplemented, "method EnableEsmApps not implemented")
}
func (UnimplementedProServer) DisableEsmApps(context.Context, *emptypb.Empty) (*emptypb.Empty, error) {
	return nil, status.Errorf(codes.Unimplemented, "method DisableEsmApps not implemented")
}
func (UnimplementedProServer) EnableKernelLivePatch(context.Context, *emptypb.Empty) (*emptypb.Empty, error) {
	return nil, status.Errorf(codes.Unimplemented, "method EnableKernelLivePatch not implemented")
}
func (UnimplementedProServer) DisableKernelLivePatch(context.Context, *emptypb.Empty) (*emptypb.Empty, error) {
	return nil, status.Errorf(codes.Unimplemented, "method DisableKernelLivePatch not implemented")
}
func (UnimplementedProServer) mustEmbedUnimplementedProServer() {}

// UnsafeProServer may be embedded to opt out of forward compatibility for this service.
// Use of this interface is not recommended, as added methods to ProServer will
// result in compilation errors.
type UnsafeProServer interface {
	mustEmbedUnimplementedProServer()
}

func RegisterProServer(s *grpc.Server, srv ProServer) {
	s.RegisterService(&_Pro_serviceDesc, srv)
}

func _Pro_IsMachineProAttached_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(emptypb.Empty)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(ProServer).IsMachineProAttached(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/Pro/IsMachineProAttached",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(ProServer).IsMachineProAttached(ctx, req.(*emptypb.Empty))
	}
	return interceptor(ctx, in, info, handler)
}

func _Pro_IsEsmInfraEnabled_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(emptypb.Empty)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(ProServer).IsEsmInfraEnabled(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/Pro/IsEsmInfraEnabled",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(ProServer).IsEsmInfraEnabled(ctx, req.(*emptypb.Empty))
	}
	return interceptor(ctx, in, info, handler)
}

func _Pro_IsEsmAppsEnabled_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(emptypb.Empty)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(ProServer).IsEsmAppsEnabled(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/Pro/IsEsmAppsEnabled",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(ProServer).IsEsmAppsEnabled(ctx, req.(*emptypb.Empty))
	}
	return interceptor(ctx, in, info, handler)
}

func _Pro_IsKernelLivePatchEnabled_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(emptypb.Empty)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(ProServer).IsKernelLivePatchEnabled(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/Pro/IsKernelLivePatchEnabled",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(ProServer).IsKernelLivePatchEnabled(ctx, req.(*emptypb.Empty))
	}
	return interceptor(ctx, in, info, handler)
}

func _Pro_InitiateProMagicFlow_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(emptypb.Empty)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(ProServer).InitiateProMagicFlow(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/Pro/InitiateProMagicFlow",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(ProServer).InitiateProMagicFlow(ctx, req.(*emptypb.Empty))
	}
	return interceptor(ctx, in, info, handler)
}

func _Pro_WaitProMagicFlow_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(emptypb.Empty)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(ProServer).WaitProMagicFlow(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/Pro/WaitProMagicFlow",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(ProServer).WaitProMagicFlow(ctx, req.(*emptypb.Empty))
	}
	return interceptor(ctx, in, info, handler)
}

func _Pro_AttachProToMachine_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(AttachRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(ProServer).AttachProToMachine(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/Pro/AttachProToMachine",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(ProServer).AttachProToMachine(ctx, req.(*AttachRequest))
	}
	return interceptor(ctx, in, info, handler)
}

func _Pro_EnableInfra_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(emptypb.Empty)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(ProServer).EnableInfra(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/Pro/EnableInfra",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(ProServer).EnableInfra(ctx, req.(*emptypb.Empty))
	}
	return interceptor(ctx, in, info, handler)
}

func _Pro_DisableInfra_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(emptypb.Empty)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(ProServer).DisableInfra(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/Pro/DisableInfra",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(ProServer).DisableInfra(ctx, req.(*emptypb.Empty))
	}
	return interceptor(ctx, in, info, handler)
}

func _Pro_EnableEsmApps_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(emptypb.Empty)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(ProServer).EnableEsmApps(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/Pro/EnableEsmApps",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(ProServer).EnableEsmApps(ctx, req.(*emptypb.Empty))
	}
	return interceptor(ctx, in, info, handler)
}

func _Pro_DisableEsmApps_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(emptypb.Empty)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(ProServer).DisableEsmApps(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/Pro/DisableEsmApps",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(ProServer).DisableEsmApps(ctx, req.(*emptypb.Empty))
	}
	return interceptor(ctx, in, info, handler)
}

func _Pro_EnableKernelLivePatch_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(emptypb.Empty)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(ProServer).EnableKernelLivePatch(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/Pro/EnableKernelLivePatch",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(ProServer).EnableKernelLivePatch(ctx, req.(*emptypb.Empty))
	}
	return interceptor(ctx, in, info, handler)
}

func _Pro_DisableKernelLivePatch_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(emptypb.Empty)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(ProServer).DisableKernelLivePatch(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/Pro/DisableKernelLivePatch",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(ProServer).DisableKernelLivePatch(ctx, req.(*emptypb.Empty))
	}
	return interceptor(ctx, in, info, handler)
}

var _Pro_serviceDesc = grpc.ServiceDesc{
	ServiceName: "Pro",
	HandlerType: (*ProServer)(nil),
	Methods: []grpc.MethodDesc{
		{
			MethodName: "IsMachineProAttached",
			Handler:    _Pro_IsMachineProAttached_Handler,
		},
		{
			MethodName: "IsEsmInfraEnabled",
			Handler:    _Pro_IsEsmInfraEnabled_Handler,
		},
		{
			MethodName: "IsEsmAppsEnabled",
			Handler:    _Pro_IsEsmAppsEnabled_Handler,
		},
		{
			MethodName: "IsKernelLivePatchEnabled",
			Handler:    _Pro_IsKernelLivePatchEnabled_Handler,
		},
		{
			MethodName: "InitiateProMagicFlow",
			Handler:    _Pro_InitiateProMagicFlow_Handler,
		},
		{
			MethodName: "WaitProMagicFlow",
			Handler:    _Pro_WaitProMagicFlow_Handler,
		},
		{
			MethodName: "AttachProToMachine",
			Handler:    _Pro_AttachProToMachine_Handler,
		},
		{
			MethodName: "EnableInfra",
			Handler:    _Pro_EnableInfra_Handler,
		},
		{
			MethodName: "DisableInfra",
			Handler:    _Pro_DisableInfra_Handler,
		},
		{
			MethodName: "EnableEsmApps",
			Handler:    _Pro_EnableEsmApps_Handler,
		},
		{
			MethodName: "DisableEsmApps",
			Handler:    _Pro_DisableEsmApps_Handler,
		},
		{
			MethodName: "EnableKernelLivePatch",
			Handler:    _Pro_EnableKernelLivePatch_Handler,
		},
		{
			MethodName: "DisableKernelLivePatch",
			Handler:    _Pro_DisableKernelLivePatch_Handler,
		},
	},
	Streams:  []grpc.StreamDesc{},
	Metadata: "dsc.proto",
}