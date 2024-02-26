// Code generated by protoc-gen-go. DO NOT EDIT.
// versions:
// 	protoc-gen-go v1.28.1
// 	protoc        v3.21.12
// source: dsc.proto

package __

import (
	protoreflect "google.golang.org/protobuf/reflect/protoreflect"
	protoimpl "google.golang.org/protobuf/runtime/protoimpl"
	emptypb "google.golang.org/protobuf/types/known/emptypb"
	wrapperspb "google.golang.org/protobuf/types/known/wrapperspb"
	reflect "reflect"
	sync "sync"
)

const (
	// Verify that this generated code is sufficiently up-to-date.
	_ = protoimpl.EnforceVersion(20 - protoimpl.MinVersion)
	// Verify that runtime/protoimpl is sufficiently up-to-date.
	_ = protoimpl.EnforceVersion(protoimpl.MaxVersion - 20)
)

type IsSecureBootEnabledResponse struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Enabled bool `protobuf:"varint,1,opt,name=enabled,proto3" json:"enabled,omitempty"`
}

func (x *IsSecureBootEnabledResponse) Reset() {
	*x = IsSecureBootEnabledResponse{}
	if protoimpl.UnsafeEnabled {
		mi := &file_dsc_proto_msgTypes[0]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *IsSecureBootEnabledResponse) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*IsSecureBootEnabledResponse) ProtoMessage() {}

func (x *IsSecureBootEnabledResponse) ProtoReflect() protoreflect.Message {
	mi := &file_dsc_proto_msgTypes[0]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use IsSecureBootEnabledResponse.ProtoReflect.Descriptor instead.
func (*IsSecureBootEnabledResponse) Descriptor() ([]byte, []int) {
	return file_dsc_proto_rawDescGZIP(), []int{0}
}

func (x *IsSecureBootEnabledResponse) GetEnabled() bool {
	if x != nil {
		return x.Enabled
	}
	return false
}

type AttachRequest struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Token string `protobuf:"bytes,1,opt,name=token,proto3" json:"token,omitempty"`
}

func (x *AttachRequest) Reset() {
	*x = AttachRequest{}
	if protoimpl.UnsafeEnabled {
		mi := &file_dsc_proto_msgTypes[1]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *AttachRequest) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*AttachRequest) ProtoMessage() {}

func (x *AttachRequest) ProtoReflect() protoreflect.Message {
	mi := &file_dsc_proto_msgTypes[1]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use AttachRequest.ProtoReflect.Descriptor instead.
func (*AttachRequest) Descriptor() ([]byte, []int) {
	return file_dsc_proto_rawDescGZIP(), []int{1}
}

func (x *AttachRequest) GetToken() string {
	if x != nil {
		return x.Token
	}
	return ""
}

type InitiateResponse struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Pin       string `protobuf:"bytes,1,opt,name=pin,proto3" json:"pin,omitempty"`
	ExpiresIn int64  `protobuf:"varint,2,opt,name=expiresIn,proto3" json:"expiresIn,omitempty"`
}

func (x *InitiateResponse) Reset() {
	*x = InitiateResponse{}
	if protoimpl.UnsafeEnabled {
		mi := &file_dsc_proto_msgTypes[2]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *InitiateResponse) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*InitiateResponse) ProtoMessage() {}

func (x *InitiateResponse) ProtoReflect() protoreflect.Message {
	mi := &file_dsc_proto_msgTypes[2]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use InitiateResponse.ProtoReflect.Descriptor instead.
func (*InitiateResponse) Descriptor() ([]byte, []int) {
	return file_dsc_proto_rawDescGZIP(), []int{2}
}

func (x *InitiateResponse) GetPin() string {
	if x != nil {
		return x.Pin
	}
	return ""
}

func (x *InitiateResponse) GetExpiresIn() int64 {
	if x != nil {
		return x.ExpiresIn
	}
	return 0
}

type WaitResponse struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Token string `protobuf:"bytes,1,opt,name=token,proto3" json:"token,omitempty"`
}

func (x *WaitResponse) Reset() {
	*x = WaitResponse{}
	if protoimpl.UnsafeEnabled {
		mi := &file_dsc_proto_msgTypes[3]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *WaitResponse) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*WaitResponse) ProtoMessage() {}

func (x *WaitResponse) ProtoReflect() protoreflect.Message {
	mi := &file_dsc_proto_msgTypes[3]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use WaitResponse.ProtoReflect.Descriptor instead.
func (*WaitResponse) Descriptor() ([]byte, []int) {
	return file_dsc_proto_rawDescGZIP(), []int{3}
}

func (x *WaitResponse) GetToken() string {
	if x != nil {
		return x.Token
	}
	return ""
}

var File_dsc_proto protoreflect.FileDescriptor

var file_dsc_proto_rawDesc = []byte{
	0x0a, 0x09, 0x64, 0x73, 0x63, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x1a, 0x1b, 0x67, 0x6f, 0x6f,
	0x67, 0x6c, 0x65, 0x2f, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x62, 0x75, 0x66, 0x2f, 0x65, 0x6d, 0x70,
	0x74, 0x79, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x1a, 0x1e, 0x67, 0x6f, 0x6f, 0x67, 0x6c, 0x65,
	0x2f, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x62, 0x75, 0x66, 0x2f, 0x77, 0x72, 0x61, 0x70, 0x70, 0x65,
	0x72, 0x73, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x22, 0x37, 0x0a, 0x1b, 0x49, 0x73, 0x53, 0x65,
	0x63, 0x75, 0x72, 0x65, 0x42, 0x6f, 0x6f, 0x74, 0x45, 0x6e, 0x61, 0x62, 0x6c, 0x65, 0x64, 0x52,
	0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x12, 0x18, 0x0a, 0x07, 0x65, 0x6e, 0x61, 0x62, 0x6c,
	0x65, 0x64, 0x18, 0x01, 0x20, 0x01, 0x28, 0x08, 0x52, 0x07, 0x65, 0x6e, 0x61, 0x62, 0x6c, 0x65,
	0x64, 0x22, 0x25, 0x0a, 0x0d, 0x41, 0x74, 0x74, 0x61, 0x63, 0x68, 0x52, 0x65, 0x71, 0x75, 0x65,
	0x73, 0x74, 0x12, 0x14, 0x0a, 0x05, 0x74, 0x6f, 0x6b, 0x65, 0x6e, 0x18, 0x01, 0x20, 0x01, 0x28,
	0x09, 0x52, 0x05, 0x74, 0x6f, 0x6b, 0x65, 0x6e, 0x22, 0x42, 0x0a, 0x10, 0x49, 0x6e, 0x69, 0x74,
	0x69, 0x61, 0x74, 0x65, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x12, 0x10, 0x0a, 0x03,
	0x70, 0x69, 0x6e, 0x18, 0x01, 0x20, 0x01, 0x28, 0x09, 0x52, 0x03, 0x70, 0x69, 0x6e, 0x12, 0x1c,
	0x0a, 0x09, 0x65, 0x78, 0x70, 0x69, 0x72, 0x65, 0x73, 0x49, 0x6e, 0x18, 0x02, 0x20, 0x01, 0x28,
	0x03, 0x52, 0x09, 0x65, 0x78, 0x70, 0x69, 0x72, 0x65, 0x73, 0x49, 0x6e, 0x22, 0x24, 0x0a, 0x0c,
	0x57, 0x61, 0x69, 0x74, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x12, 0x14, 0x0a, 0x05,
	0x74, 0x6f, 0x6b, 0x65, 0x6e, 0x18, 0x01, 0x20, 0x01, 0x28, 0x09, 0x52, 0x05, 0x74, 0x6f, 0x6b,
	0x65, 0x6e, 0x32, 0x59, 0x0a, 0x08, 0x48, 0x61, 0x72, 0x64, 0x77, 0x61, 0x72, 0x65, 0x12, 0x4d,
	0x0a, 0x13, 0x49, 0x73, 0x53, 0x65, 0x63, 0x75, 0x72, 0x65, 0x42, 0x6f, 0x6f, 0x74, 0x45, 0x6e,
	0x61, 0x62, 0x6c, 0x65, 0x64, 0x12, 0x16, 0x2e, 0x67, 0x6f, 0x6f, 0x67, 0x6c, 0x65, 0x2e, 0x70,
	0x72, 0x6f, 0x74, 0x6f, 0x62, 0x75, 0x66, 0x2e, 0x45, 0x6d, 0x70, 0x74, 0x79, 0x1a, 0x1c, 0x2e,
	0x49, 0x73, 0x53, 0x65, 0x63, 0x75, 0x72, 0x65, 0x42, 0x6f, 0x6f, 0x74, 0x45, 0x6e, 0x61, 0x62,
	0x6c, 0x65, 0x64, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x22, 0x00, 0x32, 0x9d, 0x07,
	0x0a, 0x03, 0x50, 0x72, 0x6f, 0x12, 0x4c, 0x0a, 0x14, 0x49, 0x73, 0x4d, 0x61, 0x63, 0x68, 0x69,
	0x6e, 0x65, 0x50, 0x72, 0x6f, 0x41, 0x74, 0x74, 0x61, 0x63, 0x68, 0x65, 0x64, 0x12, 0x16, 0x2e,
	0x67, 0x6f, 0x6f, 0x67, 0x6c, 0x65, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x62, 0x75, 0x66, 0x2e,
	0x45, 0x6d, 0x70, 0x74, 0x79, 0x1a, 0x1a, 0x2e, 0x67, 0x6f, 0x6f, 0x67, 0x6c, 0x65, 0x2e, 0x70,
	0x72, 0x6f, 0x74, 0x6f, 0x62, 0x75, 0x66, 0x2e, 0x42, 0x6f, 0x6f, 0x6c, 0x56, 0x61, 0x6c, 0x75,
	0x65, 0x22, 0x00, 0x12, 0x49, 0x0a, 0x11, 0x49, 0x73, 0x45, 0x73, 0x6d, 0x49, 0x6e, 0x66, 0x72,
	0x61, 0x45, 0x6e, 0x61, 0x62, 0x6c, 0x65, 0x64, 0x12, 0x16, 0x2e, 0x67, 0x6f, 0x6f, 0x67, 0x6c,
	0x65, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x62, 0x75, 0x66, 0x2e, 0x45, 0x6d, 0x70, 0x74, 0x79,
	0x1a, 0x1a, 0x2e, 0x67, 0x6f, 0x6f, 0x67, 0x6c, 0x65, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x62,
	0x75, 0x66, 0x2e, 0x42, 0x6f, 0x6f, 0x6c, 0x56, 0x61, 0x6c, 0x75, 0x65, 0x22, 0x00, 0x12, 0x48,
	0x0a, 0x10, 0x49, 0x73, 0x45, 0x73, 0x6d, 0x41, 0x70, 0x70, 0x73, 0x45, 0x6e, 0x61, 0x62, 0x6c,
	0x65, 0x64, 0x12, 0x16, 0x2e, 0x67, 0x6f, 0x6f, 0x67, 0x6c, 0x65, 0x2e, 0x70, 0x72, 0x6f, 0x74,
	0x6f, 0x62, 0x75, 0x66, 0x2e, 0x45, 0x6d, 0x70, 0x74, 0x79, 0x1a, 0x1a, 0x2e, 0x67, 0x6f, 0x6f,
	0x67, 0x6c, 0x65, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x62, 0x75, 0x66, 0x2e, 0x42, 0x6f, 0x6f,
	0x6c, 0x56, 0x61, 0x6c, 0x75, 0x65, 0x22, 0x00, 0x12, 0x50, 0x0a, 0x18, 0x49, 0x73, 0x4b, 0x65,
	0x72, 0x6e, 0x65, 0x6c, 0x4c, 0x69, 0x76, 0x65, 0x50, 0x61, 0x74, 0x63, 0x68, 0x45, 0x6e, 0x61,
	0x62, 0x6c, 0x65, 0x64, 0x12, 0x16, 0x2e, 0x67, 0x6f, 0x6f, 0x67, 0x6c, 0x65, 0x2e, 0x70, 0x72,
	0x6f, 0x74, 0x6f, 0x62, 0x75, 0x66, 0x2e, 0x45, 0x6d, 0x70, 0x74, 0x79, 0x1a, 0x1a, 0x2e, 0x67,
	0x6f, 0x6f, 0x67, 0x6c, 0x65, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x62, 0x75, 0x66, 0x2e, 0x42,
	0x6f, 0x6f, 0x6c, 0x56, 0x61, 0x6c, 0x75, 0x65, 0x22, 0x00, 0x12, 0x43, 0x0a, 0x14, 0x49, 0x6e,
	0x69, 0x74, 0x69, 0x61, 0x74, 0x65, 0x50, 0x72, 0x6f, 0x4d, 0x61, 0x67, 0x69, 0x63, 0x46, 0x6c,
	0x6f, 0x77, 0x12, 0x16, 0x2e, 0x67, 0x6f, 0x6f, 0x67, 0x6c, 0x65, 0x2e, 0x70, 0x72, 0x6f, 0x74,
	0x6f, 0x62, 0x75, 0x66, 0x2e, 0x45, 0x6d, 0x70, 0x74, 0x79, 0x1a, 0x11, 0x2e, 0x49, 0x6e, 0x69,
	0x74, 0x69, 0x61, 0x74, 0x65, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x22, 0x00, 0x12,
	0x3b, 0x0a, 0x10, 0x57, 0x61, 0x69, 0x74, 0x50, 0x72, 0x6f, 0x4d, 0x61, 0x67, 0x69, 0x63, 0x46,
	0x6c, 0x6f, 0x77, 0x12, 0x16, 0x2e, 0x67, 0x6f, 0x6f, 0x67, 0x6c, 0x65, 0x2e, 0x70, 0x72, 0x6f,
	0x74, 0x6f, 0x62, 0x75, 0x66, 0x2e, 0x45, 0x6d, 0x70, 0x74, 0x79, 0x1a, 0x0d, 0x2e, 0x57, 0x61,
	0x69, 0x74, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x22, 0x00, 0x12, 0x3e, 0x0a, 0x12,
	0x41, 0x74, 0x74, 0x61, 0x63, 0x68, 0x50, 0x72, 0x6f, 0x54, 0x6f, 0x4d, 0x61, 0x63, 0x68, 0x69,
	0x6e, 0x65, 0x12, 0x0e, 0x2e, 0x41, 0x74, 0x74, 0x61, 0x63, 0x68, 0x52, 0x65, 0x71, 0x75, 0x65,
	0x73, 0x74, 0x1a, 0x16, 0x2e, 0x67, 0x6f, 0x6f, 0x67, 0x6c, 0x65, 0x2e, 0x70, 0x72, 0x6f, 0x74,
	0x6f, 0x62, 0x75, 0x66, 0x2e, 0x45, 0x6d, 0x70, 0x74, 0x79, 0x22, 0x00, 0x12, 0x3f, 0x0a, 0x0b,
	0x45, 0x6e, 0x61, 0x62, 0x6c, 0x65, 0x49, 0x6e, 0x66, 0x72, 0x61, 0x12, 0x16, 0x2e, 0x67, 0x6f,
	0x6f, 0x67, 0x6c, 0x65, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x62, 0x75, 0x66, 0x2e, 0x45, 0x6d,
	0x70, 0x74, 0x79, 0x1a, 0x16, 0x2e, 0x67, 0x6f, 0x6f, 0x67, 0x6c, 0x65, 0x2e, 0x70, 0x72, 0x6f,
	0x74, 0x6f, 0x62, 0x75, 0x66, 0x2e, 0x45, 0x6d, 0x70, 0x74, 0x79, 0x22, 0x00, 0x12, 0x40, 0x0a,
	0x0c, 0x44, 0x69, 0x73, 0x61, 0x62, 0x6c, 0x65, 0x49, 0x6e, 0x66, 0x72, 0x61, 0x12, 0x16, 0x2e,
	0x67, 0x6f, 0x6f, 0x67, 0x6c, 0x65, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x62, 0x75, 0x66, 0x2e,
	0x45, 0x6d, 0x70, 0x74, 0x79, 0x1a, 0x16, 0x2e, 0x67, 0x6f, 0x6f, 0x67, 0x6c, 0x65, 0x2e, 0x70,
	0x72, 0x6f, 0x74, 0x6f, 0x62, 0x75, 0x66, 0x2e, 0x45, 0x6d, 0x70, 0x74, 0x79, 0x22, 0x00, 0x12,
	0x41, 0x0a, 0x0d, 0x45, 0x6e, 0x61, 0x62, 0x6c, 0x65, 0x45, 0x73, 0x6d, 0x41, 0x70, 0x70, 0x73,
	0x12, 0x16, 0x2e, 0x67, 0x6f, 0x6f, 0x67, 0x6c, 0x65, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x62,
	0x75, 0x66, 0x2e, 0x45, 0x6d, 0x70, 0x74, 0x79, 0x1a, 0x16, 0x2e, 0x67, 0x6f, 0x6f, 0x67, 0x6c,
	0x65, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x62, 0x75, 0x66, 0x2e, 0x45, 0x6d, 0x70, 0x74, 0x79,
	0x22, 0x00, 0x12, 0x42, 0x0a, 0x0e, 0x44, 0x69, 0x73, 0x61, 0x62, 0x6c, 0x65, 0x45, 0x73, 0x6d,
	0x41, 0x70, 0x70, 0x73, 0x12, 0x16, 0x2e, 0x67, 0x6f, 0x6f, 0x67, 0x6c, 0x65, 0x2e, 0x70, 0x72,
	0x6f, 0x74, 0x6f, 0x62, 0x75, 0x66, 0x2e, 0x45, 0x6d, 0x70, 0x74, 0x79, 0x1a, 0x16, 0x2e, 0x67,
	0x6f, 0x6f, 0x67, 0x6c, 0x65, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x62, 0x75, 0x66, 0x2e, 0x45,
	0x6d, 0x70, 0x74, 0x79, 0x22, 0x00, 0x12, 0x49, 0x0a, 0x15, 0x45, 0x6e, 0x61, 0x62, 0x6c, 0x65,
	0x4b, 0x65, 0x72, 0x6e, 0x65, 0x6c, 0x4c, 0x69, 0x76, 0x65, 0x50, 0x61, 0x74, 0x63, 0x68, 0x12,
	0x16, 0x2e, 0x67, 0x6f, 0x6f, 0x67, 0x6c, 0x65, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x62, 0x75,
	0x66, 0x2e, 0x45, 0x6d, 0x70, 0x74, 0x79, 0x1a, 0x16, 0x2e, 0x67, 0x6f, 0x6f, 0x67, 0x6c, 0x65,
	0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x62, 0x75, 0x66, 0x2e, 0x45, 0x6d, 0x70, 0x74, 0x79, 0x22,
	0x00, 0x12, 0x4a, 0x0a, 0x16, 0x44, 0x69, 0x73, 0x61, 0x62, 0x6c, 0x65, 0x4b, 0x65, 0x72, 0x6e,
	0x65, 0x6c, 0x4c, 0x69, 0x76, 0x65, 0x50, 0x61, 0x74, 0x63, 0x68, 0x12, 0x16, 0x2e, 0x67, 0x6f,
	0x6f, 0x67, 0x6c, 0x65, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x62, 0x75, 0x66, 0x2e, 0x45, 0x6d,
	0x70, 0x74, 0x79, 0x1a, 0x16, 0x2e, 0x67, 0x6f, 0x6f, 0x67, 0x6c, 0x65, 0x2e, 0x70, 0x72, 0x6f,
	0x74, 0x6f, 0x62, 0x75, 0x66, 0x2e, 0x45, 0x6d, 0x70, 0x74, 0x79, 0x22, 0x00, 0x42, 0x04, 0x5a,
	0x02, 0x2e, 0x2f, 0x62, 0x06, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x33,
}

var (
	file_dsc_proto_rawDescOnce sync.Once
	file_dsc_proto_rawDescData = file_dsc_proto_rawDesc
)

func file_dsc_proto_rawDescGZIP() []byte {
	file_dsc_proto_rawDescOnce.Do(func() {
		file_dsc_proto_rawDescData = protoimpl.X.CompressGZIP(file_dsc_proto_rawDescData)
	})
	return file_dsc_proto_rawDescData
}

var file_dsc_proto_msgTypes = make([]protoimpl.MessageInfo, 4)
var file_dsc_proto_goTypes = []interface{}{
	(*IsSecureBootEnabledResponse)(nil), // 0: IsSecureBootEnabledResponse
	(*AttachRequest)(nil),               // 1: AttachRequest
	(*InitiateResponse)(nil),            // 2: InitiateResponse
	(*WaitResponse)(nil),                // 3: WaitResponse
	(*emptypb.Empty)(nil),               // 4: google.protobuf.Empty
	(*wrapperspb.BoolValue)(nil),        // 5: google.protobuf.BoolValue
}
var file_dsc_proto_depIdxs = []int32{
	4,  // 0: Hardware.IsSecureBootEnabled:input_type -> google.protobuf.Empty
	4,  // 1: Pro.IsMachineProAttached:input_type -> google.protobuf.Empty
	4,  // 2: Pro.IsEsmInfraEnabled:input_type -> google.protobuf.Empty
	4,  // 3: Pro.IsEsmAppsEnabled:input_type -> google.protobuf.Empty
	4,  // 4: Pro.IsKernelLivePatchEnabled:input_type -> google.protobuf.Empty
	4,  // 5: Pro.InitiateProMagicFlow:input_type -> google.protobuf.Empty
	4,  // 6: Pro.WaitProMagicFlow:input_type -> google.protobuf.Empty
	1,  // 7: Pro.AttachProToMachine:input_type -> AttachRequest
	4,  // 8: Pro.EnableInfra:input_type -> google.protobuf.Empty
	4,  // 9: Pro.DisableInfra:input_type -> google.protobuf.Empty
	4,  // 10: Pro.EnableEsmApps:input_type -> google.protobuf.Empty
	4,  // 11: Pro.DisableEsmApps:input_type -> google.protobuf.Empty
	4,  // 12: Pro.EnableKernelLivePatch:input_type -> google.protobuf.Empty
	4,  // 13: Pro.DisableKernelLivePatch:input_type -> google.protobuf.Empty
	0,  // 14: Hardware.IsSecureBootEnabled:output_type -> IsSecureBootEnabledResponse
	5,  // 15: Pro.IsMachineProAttached:output_type -> google.protobuf.BoolValue
	5,  // 16: Pro.IsEsmInfraEnabled:output_type -> google.protobuf.BoolValue
	5,  // 17: Pro.IsEsmAppsEnabled:output_type -> google.protobuf.BoolValue
	5,  // 18: Pro.IsKernelLivePatchEnabled:output_type -> google.protobuf.BoolValue
	2,  // 19: Pro.InitiateProMagicFlow:output_type -> InitiateResponse
	3,  // 20: Pro.WaitProMagicFlow:output_type -> WaitResponse
	4,  // 21: Pro.AttachProToMachine:output_type -> google.protobuf.Empty
	4,  // 22: Pro.EnableInfra:output_type -> google.protobuf.Empty
	4,  // 23: Pro.DisableInfra:output_type -> google.protobuf.Empty
	4,  // 24: Pro.EnableEsmApps:output_type -> google.protobuf.Empty
	4,  // 25: Pro.DisableEsmApps:output_type -> google.protobuf.Empty
	4,  // 26: Pro.EnableKernelLivePatch:output_type -> google.protobuf.Empty
	4,  // 27: Pro.DisableKernelLivePatch:output_type -> google.protobuf.Empty
	14, // [14:28] is the sub-list for method output_type
	0,  // [0:14] is the sub-list for method input_type
	0,  // [0:0] is the sub-list for extension type_name
	0,  // [0:0] is the sub-list for extension extendee
	0,  // [0:0] is the sub-list for field type_name
}

func init() { file_dsc_proto_init() }
func file_dsc_proto_init() {
	if File_dsc_proto != nil {
		return
	}
	if !protoimpl.UnsafeEnabled {
		file_dsc_proto_msgTypes[0].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*IsSecureBootEnabledResponse); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_dsc_proto_msgTypes[1].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*AttachRequest); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_dsc_proto_msgTypes[2].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*InitiateResponse); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_dsc_proto_msgTypes[3].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*WaitResponse); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
	}
	type x struct{}
	out := protoimpl.TypeBuilder{
		File: protoimpl.DescBuilder{
			GoPackagePath: reflect.TypeOf(x{}).PkgPath(),
			RawDescriptor: file_dsc_proto_rawDesc,
			NumEnums:      0,
			NumMessages:   4,
			NumExtensions: 0,
			NumServices:   2,
		},
		GoTypes:           file_dsc_proto_goTypes,
		DependencyIndexes: file_dsc_proto_depIdxs,
		MessageInfos:      file_dsc_proto_msgTypes,
	}.Build()
	File_dsc_proto = out.File
	file_dsc_proto_rawDesc = nil
	file_dsc_proto_goTypes = nil
	file_dsc_proto_depIdxs = nil
}